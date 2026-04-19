trigger OpportunityTrigger on Opportunity(before insert, after insert,before update,after update,before delete, after delete, after undelete){
    if(Trigger.isInsert){
        if(Trigger.Isbefore){
            OpportunityHandler.Q2(Trigger.New);
            OpportunityHandler.Q22(Trigger.New);
        }
        if(Trigger.isAfter){
            //OpportunityHandler.Q8(Trigger.New);
            OpportunityHandler.Q36(Trigger.New, Null);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            OpportunityHandler.Q13(Trigger.New, Trigger.oldMap);
            OpportunityHandler.Q24(Trigger.New, Trigger.oldMap);
        }
        if(Trigger.isafter){
            OpportunityHandler.Q18(Trigger.New, Trigger.oldMap);
            OpportunityHandler.Q36(Trigger.New, Trigger.oldMap);
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            OpportunityHandler.Q26(Trigger.old);
        }
        if(Trigger.isAfter){
            OpportunityHandler.Q36(Trigger.old, Null);
        }
    }
    if(Trigger.isUndelete){
        if(Trigger.isAfter){
            OpportunityHandler.Q36(Trigger.New, Null);
        }
    }
    
}