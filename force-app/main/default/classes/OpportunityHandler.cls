public class OpportunityHandler{
    public static void Q2(List<Opportunity> newList){
        for(Opportunity opp:newList){
            if(opp.Amount!=Null && opp.Amount>100000){
                opp.Description = 'Hot Opportunity';
            }
        }
    }
    public static void Q8(List<Opportunity>newList){
        List<Account> accList = New List<Account>();
        for(Opportunity opp:newList){
            if(opp.AccountId!=Null){
                Account acc = New Account();
                acc.Recent_Opportunity_Amount__c = opp.Amount;
                acc.Id = opp.AccountId;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    public static void Q13(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        for(Opportunity opp:newList){
            if(opp.StageName != oldMap.get(opp.Id).StageName){
                if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Opp is Closed Lost';
                }else if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opp is Closed Won';
                }else{
                    opp.Description = 'Opp is open';
                }
            }
        }       
    }
    public static void Q18(List<Opportunity> newList, Map<Id,Opportunity>oldMap){
        //Map<Id,Opportunity> oppMap = New Map<Id,Opportunity>();
        List<Task> tcList = New List<Task>();
        
        for(Opportunity opp:newList){
            if(oldMap!=Null && opp.stageName != oldMap.get(opp.Id).StageName){
                Task tc = new Task();
                tc.WhatId = opp.Id;
                tc.Subject = 'Call';
                tc.ownerId = UserInfo.getUserid();
                tc.Status = 'Not Started';
                tc.ActivityDate = system.today();
                tcList.add(tc);
            }
        }
        if(!tcList.isEmpty()){
            insert tcList;
        }       
    }
    public static void Q22(List<Opportunity> newList){
        for(Opportunity opp:newList){
            if(opp.Amount == null){
                opp.addError(Label.Opp_Amount_Label);
            }
        }
    }
    public static void Q24(List<Opportunity> newList, Map<Id,Opportunity>oldMap){
        for(Opportunity opp:newList){
            if(oldMap!=Null && opp.StageName!=oldMap.get(opp.id).StageName && opp.StageName=='Closed Lost' && opp.Close_Lost_Reason__c==Null){
                opp.addError('Please Populate Closed Lost Reason');
            }
        }
    }
    public static void Q1(List<Opportunity> newList, Map<Id,Opportunity>oldMap){
        List<Project__c> pjList = New List<Project__c>();
        for(Opportunity opp:newList){
            if(opp.stageName != oldMap.get(opp.Id).StageName && (opp.StageName=='Closed Lost'|| opp.StageName == 'Closed Won')){
                Project__c pos = New Project__c();
                pos.Name = opp.Name;               
                pos.Opportunity__c = opp.Id;
                pjList.add(pos);                
            }
        }
        if(!pjList.isEmpty()){
            insert pjList;
        }
    }        
    public static void Q26(List<Opportunity>oldList){
        Profile p =[SELECT Id, Name FROM Profile WHERE Name='System Administrator'];
        for(Opportunity opp:oldList){
            if(UserInfo.getProfileId() != p.Id &&(opp.stageName == 'Closed Won'|| opp.stageName == 'Closed Lost')){
                opp.addError('If Opportunity is closed then only system admin can delete');
            }
        }
    }
    public static void Q36(List<Opportunity>opList, Map<Id,Opportunity>oldMap){
        Set<Id> accid = New Set<Id>();
        
        for(Opportunity opp:opList){
            if((opp.Amount!=Null && opp.AccountId!=Null && oldMap==Null)||(opp.Amount!=oldMap.get(opp.Id).Amount && oldMap!=Null)){
                accid.add(opp.AccountId);
            }
        }
        List<Opportunity> oppList = [SELECT Id,Amount,AccountId From Opportunity WHERE AccountId IN:accId];
        Map<Id,Account> accMap = New Map<Id,Account>();
        for(Opportunity opp:oppList){
            Account acc = New Account();
            acc.Id = opp.AccountId;
            if(accMap.containsKey(opp.AccountId)){
                acc.AnnualRevenue = accMap.get(opp.AccountId).AnnualRevenue + opp.Amount;
            }else{
                acc.AnnualRevenue = opp.Amount;
            }
            accMap.put(opp.AccountId,acc);
        }
        if(!accMap.isEmpty()){
            update accMap.values();
        }
        List<Account> accupdate = [SELECT Id,AnnualRevenue,(SELECT Id, Amount FROM Opportunities)FROM Account WHERE Id IN:accId];
        for(Account acc:accupdate){
            if(acc.opportunities.size()==0){
                acc.AnnualRevenue=0;
            }
        }
        update accupdate;
    }
}