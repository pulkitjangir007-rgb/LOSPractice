trigger CaseTrigger on Case (After insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            CaseTriggerHandler.Q7(Trigger.New);
            CaseTriggerHandler.Q34(Trigger.New);
        }
    }
}