public class PositionTriggerHandler {
    public static void Q4(List<Position__c> newList){
        for(Position__c pos:newList){
            if(pos.Status__c == 'New Position' && pos.Open_Date__c==Null 
               && pos.Min_Pay__c==Null && pos.Max_Pay__c==Null){
                   pos.Open_Date__c = system.today();
                   pos.Min_Pay__c = 10000;
                   pos.Max_Pay__c = 15000;
               }
        }
    }
}