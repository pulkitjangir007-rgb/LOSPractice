public class AccountTriggerHandler{
    public static void Q1(List<Account> accList){
        for(Account acc:accList){
            if(acc.Industry!=Null && acc.Industry=='Media'){
                acc.Rating = 'Hot';
            }
        }
    }
    public static void Q3(List<Account> newList){
        for(Account acc:newList){
            if(acc.CopyBillingToShipping__c){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
    public static void Q5(List<Account>newList){
        List<Contact> ConList = New List<Contact>();
        for(Account acc:newList){
            Contact con = New Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            ConList.add(con);
        }
        if(!ConList.isEmpty()){
            insert conList;
        }
    }
    public static void Q6(List<Account>newList){
        List<Opportunity> oppList = New List<Opportunity>();
        for(Account acc:newList){
            if(acc.Active__c=='Yes'){
                Opportunity opp = New Opportunity();
                opp.Name = acc.Name;
                opp.stageName = 'Prospecting';
                opp.CloseDate = system.today();
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    public static void Q9(List<Account>newList){
        List<Contact> conList = New List<Contact>();
        List<Opportunity> oppList = New List<Opportunity>();
        
        for(Account acc:newList){
            if(acc.Contact__c == True){
                Contact con = New Contact();
                con.LastName = acc.Name;
                con.AccountId = acc.Id;
                conList.add(con);
            }else if(acc.Opportunity__c==True && acc.Active__c == 'Yes'){
                Opportunity opp = New Opportunity();
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = system.today();
                opp.AccountId = acc.Id;
                oppList.add(opp);
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    public static void Q10(List<Account> newList,Map<Id,Account>oldMap){
        
        for(Account acc:newList){
            if(oldMap!=Null && acc.Phone != oldMap.get(acc.id).Phone ){
                acc.Description = 'Phone is Updated! '+'Old value: '+oldMap.get(acc.Id).Phone+' & '+'New Value: '+acc.Phone;
            }
        }
    }
    public static void Q11(List<Account> newList, Map<Id,Account> oldMap){
        for(Account acc:newList){
            if((acc.CopyBillingToShipping__c && acc.BillingCity!=Null) ||
               (oldMap!=Null  && acc.CopyBillingToShipping__c && !acc.BillingCity.equals(oldMap.get(acc.id).BillingCity))){
                   acc.ShippingCity = acc.BillingCity; 
               }
        }
    }
    public static void Q12(List<Account> newList, Map<Id,Account> oldMap){
        for(Account acc:newList){
            if((acc.Industry!=Null && acc.Industry=='Media' && oldMap==Null)||
               (oldMap!=Null && acc.Industry!=oldMap.get(acc.Id).Industry && acc.Industry=='Media' )){
                   acc.Rating = 'Hot';
               }
        }        
    }
    public static void Q14(List<Account> newList, Map<Id,Account>oldMap){
        List<Contact> conList = New List<Contact>();
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        for(Account acc:newList){
            if(acc.Phone!=oldMap.get(acc.Id).Phone && oldMap!=Null){
                accMap.put(acc.Id, acc);
            }            
        }
        for(Contact con:[SELECT Id, HomePhone, AccountId FROM Contact WHERE AccountId IN:accMap.keyset()]){
            if(accMap.containsKey(con.AccountId)){
                con.HomePhone = accMap.get(con.AccountId).Phone;
                conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    public static void Q15(List<Account>newList, Map<Id,Account> oldMap){
        List<Contact> conList = New List<Contact>();
        set<Id> accId = New set<Id>();
        
        for(Account acc:newList){
            if(acc.Phone!= oldMap.get(acc.Id).Phone && oldMap!=Null){
                accId.add(acc.Id);
            }
        }
        for(Account acc:[SELECT Id,Phone,(SELECT Id,HomePhone FROM Contacts)FROM Account WHERE Id IN:accId]){
            if(acc.Contacts!=Null){
                for(Contact con:acc.Contacts){
                    con.HomePhone = acc.Phone;
                    conList.add(con);
                }
            }
            if(!conList.isEmpty()){
                update conList;
            }       
        }    
    }
    public static void Q16(List<Account> newList, Map<Id,Account>oldMap){
        List<Contact>conList = New List<Contact>();
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        for(Account acc:newList){
            if(oldMap!=Null && !acc.BillingCity.equals(oldMap.get(acc.Id).BillingCity)){
                accMap.put(acc.Id,acc);
            }
        }
        for(Contact con:[SELECT Id,AccountId,MailingCity FROM Contact WHERE AccountId IN:accMap.keyset()]){
            if(accMap.containskey(con.AccountId)){
                con.Mailingcity = accMap.get(con.AccountId).BillingCity;
                conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }        
    }
    public static void Q17(List<Account> newList, Map<Id,Account>oldMap){
        List<Contact> conList = New List<Contact>();
        set<Id> accid = New Set<Id>();
        
        for(Account acc:newList){
            if(acc.BillingCity!=Null && oldMap!=Null && !acc.BillingCity.equals(oldMap.get(acc.id).BillingCity)){
                accid.add(acc.id);
            }
        }
        for(Account acc:[SELECT Id,BillingCity,(SELECT Id, MailingCity FROM Contacts)FROM Account WHERE Id IN:accId AND BillingCity!=Null]){
            if(acc.Contacts!=Null){
                for(Contact con:acc.Contacts){
                    con.MailingCity = acc.BillingCity;
                    conList.add(con);
                }
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    public static void Q19(List<Account> newList, Map<Id,Account>oldMap){
        List<Opportunity>oppList  = New List<Opportunity>();
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        for(Account acc:newList){
            if(acc.Active__c=='No' && acc.Active__c!=oldMap.get(acc.id).Active__c && oldMap!=NUll){
                accmap.put(acc.id,acc);
            }
        }
        for(Opportunity opp:[SELECT ID,AccountId,StageName FROM Opportunity WHERE AccountId IN:accMap.keyset()]){
            if(accMap.containskey(opp.AccountId)){
                if(opp.StageName!='Closed Won'){
                    opp.StageName = 'Closed Lost';
                    oppList.add(opp);
                }
            }       
        }
        if(!accMap.isEmpty()){
            update oppList;
        }
    }
    public static void Q20(List<Account>oldList){
        for(Account acc:oldList){
            if(acc.Active__c=='Yes'){
                acc.addError('Account records cannot be deleted if active is yes');
            }
        }
    }
    public static void Q21(List<Account> newList, Map<Id,Account>oldMap){
        for(Account acc:newList){
            if(acc.CreatedDate < system.today()-7){
                acc.addError('Account cannot be edited if it creates 7 days back');
            }
        }
    }
    public static void Q25(List<Account> oldList){
        Profile p = [SELECT Id, Name FROM Profile WHERE Name='System Administrator'];
        for(Account acc:oldList){
            if(p.Id != UserInfo.getProfileId()){
                acc.addError('Only System admin can delete Account');
            }
        }
    }
    public static void Q27(List<Account>oldList){
        Map<Id,Account> accMap = New Map<Id,Account>();
        for(Account acc:oldList){
            accMap.put(acc.Id,acc);
        }
        for(Opportunity opp:[SELECT id,AccountId FROM Opportunity WHERE AccountId IN:accMap.keyset()]){
            if(accMap.containskey(opp.AccountId)){
                Account accWithOpp = accMap.get(opp.AccountId);
                accWithOpp.addError('Account cannot delete if opp is there');
            }
        }       
    }
    public static void Q28(List<Account> oldList){
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        for(Account acc:oldList){
            accMap.put(acc.Id,acc);
        }
        for(Opportunity opp:[SELECT Id,AccountId FROM Opportunity WHERE AccountId IN:accMap.keyset() AND StageName != 'Closed Lost']){
            if(accMap.containsKey(opp.AccountId)){
                Account accwithopp = accMap.get(opp.AccountId);
                accwithopp.addError('Cannot delete account if opp is open and closed Won');
            }
        }
}
}