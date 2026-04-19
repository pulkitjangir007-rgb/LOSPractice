@isTest
public class PositionTriggerHandlerTest{
    @isTest
    public static void Q4(){
        List<Position__c> posList = New List<Position__c>();
        for(Integer i=1; i<=10; i++){
            Position__c pos = New Position__c();
            pos.Name = 'UI'+i;
            pos.Status__c = 'New Position';
            posList.add(pos);
        }
        Test.StartTest();
        insert posList;
        Test.StopTest();
        List<Position__c> posList1 = [SELECT Id,Open_Date__c,Min_Pay__c,Max_Pay__c FROM Position__c WHERE Id IN: posList];
        system.assertEquals(15000,posList1[0].Max_Pay__c, 'Max Pay is not updated');
        system.assertEquals(10000,posList1[0].Min_Pay__c, 'Min Pay is not updated');
        system.assertEquals(system.today(),posList1[0].Open_Date__c, 'open date is not updated');
    }
}