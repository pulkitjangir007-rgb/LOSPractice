public class RelationshipQueries {
    public static void  ParentToChildQueryonstdfield(){
        List<Account> accList = [SELECT Id, Name,(SELECT Id, LastName FROM Contacts) FROM Account];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                system.debug('Account Id =' + acc.id);
                system.debug('Account Name = '+ acc.Name);
                for(Contact con: acc.Contacts){
                    system.debug('Contact Id:'+ con.id);
                    system.debug('Contact Name = ' + con.lastName);                   
                }
            }
        }
    }
    
    public static void AccountWithOpp(){
        List<Account> accList = [SELECT Id, Name,(SELECT Id, Name, StageName, CloseDate FROM Opportunities) FROM Account];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                system.debug('Account Id = '+ acc.id);
                system.debug('Account Name = '+ acc.Name);
                if(!acc.Opportunities.isEmpty()){
                    for(Opportunity opp:acc.Opportunities){
                        system.debug('Opportunity Id = '+ opp.id);
                        system.debug('Opportunity Name = '+ opp.Name);
                        system.debug('Opportunity Stage Name = '+ opp.StageName);
                        system.debug('Opportunity Close Date = '+ opp.CloseDate);              
                    }
                }
            }
            
        }
    }
    public static void AccountWithEmployee(){
        List<Account> accList = [SELECT ID, Name,(SELECT Id, Name, Salary__c FROM Employees__r)FROM Account];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                system.debug('Account Name = '+ acc.name);
                system.debug('Account Id = '+ acc.Id);
                if(!acc.Employees__r.isEmpty()){
                    for(Employee__c Emp: acc.Employees__r){
                        system.debug('Employee id ='+ Emp.id);
                        system.debug('Employee Name ='+ Emp.Name);
                    }
                }        
            }
        }
    }
}