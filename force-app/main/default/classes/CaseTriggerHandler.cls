public class CaseTriggerHandler {
    public static void Q7(List<Case> csList){
        List<Account> accList = New List<Account>();
        
        for(Case cs:csList){
            if(cs.AccountId != Null){
                Account acc = New Account();
                acc.Latest_Case_Number__c = cs.CaseNumber;
                acc.Id = cs.AccountId;
                accList.add(acc);               
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    public static void Q34(List<Case>newList){
        Id PartnerCase = [SELECT Id,Name FROM RecordType WHERE Name='Partner Case'].Id;
        Id customercase = [SELECT Id,Name FROM RecordType WHERE Name='Customer Case'].Id;
        set<Id>accId = New Set<Id>();
        List<Account> accList = New List<Account>();
        
        for(Case cs:newList){
            if(cs.AccountId!=Null){
                accId.add(cs.AccountId);
            }
        }
        for(Account acc:[SELECT Id,Total_Partner_Case__c,Total_Customer_Case__c,(SELECT Id,RecordTypeId FROM Cases)FROM Account WHERE Id IN:accId]){
            Decimal CountPartner = 0;
            Decimal CountCustomer = 0;
            for(Case c :acc.cases){
                if(c.RecordTypeId==PartnerCase){
                    CountPartner++;
                }else if(c.RecordTypeId==customercase){
                    CountCustomer++;
                }
            }
            acc.Total_Customer_Case__c = CountCustomer;
            acc.Total_Partner_Case__c  = CountPartner;
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}