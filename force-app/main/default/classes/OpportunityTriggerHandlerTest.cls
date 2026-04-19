@isTest
public class OpportunityTriggerHandlerTest{
    @isTest
    public static void Q3(){
        List<Opportunity> oppList = New List<Opportunity>();
        for(Integer i=1; i<=5; i++){
            Opportunity opp = New Opportunity();
            opp.Name = 'Lk'+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.Amount = 100000000;
            oppList.add(opp);                 
        }
        Test.StartTest();
        insert oppList;
        Test.StopTest();
        List<Opportunity> updatedOpp = [SELECT Id, Description FROM Opportunity WHERE Id IN:oppList];
        system.AssertEquals('Hot Opportunity',updatedOpp[0].Description, 'Description is not updated');
    }
}