trigger AccountTrigger on Account (before Insert, After insert,before update,After update, before delete){
    if(Trigger.IsInsert){
        if(Trigger.IsBefore){
            AccountTriggerHandler.Q1(Trigger.New);
            AccountTriggerHandler.Q3(Trigger.New);
            AccountTriggerHandler.Q11(Trigger.New, Null);
            AccountTriggerHandler.Q12(Trigger.New, Null);
        }
        if(Trigger.isAfter){
            //AccountTriggerHandler.Q5(Trigger.New);
            AccountTriggerHandler.Q6(Trigger.New);
            AccountTriggerHandler.Q9(Trigger.New);
        }
    }
    if(trigger.isupdate){
        if(Trigger.isbefore){
            //AccountTriggerHandler.Q10(Trigger.New, Trigger.oldMap);
            //AccountTriggerHandler.Q11(Trigger.New, Trigger.oldMap);
            //AccountTriggerHandler.Q12(Trigger.New, Trigger.oldMap);
            AccountTriggerHandler.Q21(Trigger.New, Null);
        }
        if(Trigger.isAfter){
            //AccountTriggerHandler.Q14(Trigger.New, Trigger.oldMap);
            AccountTriggerHandler.Q15(Trigger.New, Trigger.oldMap);
            //AccountTriggerHandler.Q16(Trigger.New, Trigger.oldMap);
            AccountTriggerHandler.Q17(Trigger.New, Trigger.oldMap);
            AccountTriggerHandler.Q19(Trigger.New, Trigger.oldMap);
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            AccountTriggerHandler.Q20(Trigger.old);
            AccountTriggerHandler.Q25(Trigger.old);
           // AccountTriggerHandler.Q27(Trigger.old);
            AccountTriggerHandler.Q28(Trigger.old);
        }
    }
}