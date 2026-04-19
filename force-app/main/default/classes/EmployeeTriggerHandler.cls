public class EmployeeTriggerHandler {
    public static void Q29(List<Employee__c>oldList){
        List<Employee__c> empList = New List<Employee__c>();
        Set<Id> accId = New Set<Id>();
        Map<Id,Decimal> countMap = New Map<Id,Decimal>();
        List<Account>accList = New List<Account>();
        
        for(Employee__c emp:oldList){
            if(emp.Account__c!=Null){
                empList.add(emp);
                accId.add(emp.Account__c);
            }
        }
        
        Map<Id,Account> accMap = New Map<Id,Account>([SELECT Id,Left_Employee_Count__c FROM Account WHERE Id IN:accId]);
        for(Employee__c emp1:empList){
            Decimal existingcount = accMap.get(emp1.Account__c).Left_Employee_Count__c != null 
                ? accMap.get(emp1.Account__c).Left_Employee_Count__c 
                : 0;
            
            if(countMap.containsKey(emp1.Account__c)){
                countMap.put(emp1.Account__c, countMap.get(emp1.Account__c)+1);
            }else{
                countMap.put(emp1.Account__c, existingcount+1);
            }
        }
        for(id i:countMap.keyset()){
            Account acc = New Account();
            acc.Id = i;
            acc.Left_Employee_Count__c = countMap.get(i);
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    public static void Q31(List<Employee__c>newList){
        Map<Id,Decimal> countMap = New Map<Id,Decimal>();
        List<Employee__c>empList = New List<Employee__c>();
        Set<Id>accid = New set<Id>();
        List<Account> accList = New List<Account>();
        
        for(Employee__c emp:newList){
            if(emp.Account__c!=Null){
                empList.add(emp);
                accid.add(emp.Account__c);
            }
        }
        Map<Id,Account> accMap = New Map<Id,Account>([SELECT Id,Left_Employee_Count__c FROM Account WHERE Id IN:accId]);
        
        if(!empList.isEmpty()){
            for(Employee__c emp1:empList){
                Decimal ExistingCount = accMap.get(emp1.Account__c).Left_Employee_Count__c!=Null? accMap.get(emp1.Account__c).Left_Employee_Count__c:0;
                
                if(countMap.containskey(emp1.Account__c)){
                    countMap.put(emp1.Account__c, countMap.get(emp1.Account__c)-1);
                }else{
                    countMap.put(emp1.Account__c, ExistingCount -1);
                }
            }
        }
        for(Id i:countMap.keyset()){
            Account acc = new Account();
            acc.id = i;
            acc.Left_Employee_Count__c = countmap.get(i);
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    public static void Q32(List<Employee__c>eList){
        Set<Id>accId = New Set<Id>();
        List<Account>accList = New List<Account>();
        
        for(Employee__c emp:eList){
            if(emp.Account__c!=Null){
                accId.add(emp.Account__c);
            }                
        }
        for(Account acc:[SELECT Id,Total_Employee_Count__c,(SELECT Id FROM Employees__r)FROM Account WHERE Id IN:accId]){
            if(acc.Employees__r!=Null){
                acc.Total_Employee_Count__c = acc.Employees__r.size();
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}