trigger PositionTrigger on Position__c (before insert) {
   PositionTriggerHandler.Q4(Trigger.New);
}