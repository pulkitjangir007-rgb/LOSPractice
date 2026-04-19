trigger ContactTrigger on Contact (before insert,after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            // ContactHandlerClass.Q5(Trigger.New);
        }
        if(Trigger.isAfter){
            ContactHandlerClass.Q33(Trigger.New);
        }
    }
}