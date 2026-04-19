@isTest
private class CaseHandlerTest {
    @isTest
    private static void caselat(){
        List<Account> accList = New List<Account>();
        List<Case> csList = New List<Case>();
        
        for(Integer i=1; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'ho'+i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        Test.StartTest();
        insert accList;
        
        For(Account acc:accList){
            Case cs = New Case();
            cs.Status = 'New';
            cs.Origin = 'Web';
            cs.AccountId = acc.Id;
            csList.add(cs);
        }
        insert csList;
        Test.StopTest();
    }
}