public class ScheduleJob implements Schedulable {
    public void execute(SchedulableContext sc){
        List<Opportunity> oppList = [SELECT Id, CloseDate, StageName, OwnerId FROM Opportunity Where isClosed=False and CloseDate<TODAY];
        List<Task> TaskLIst = new List<Task>();
        if(!oppList.isEmpty()){
            
            for(opportunity opp:oppList){
                Task t = new Task() ;
                t.Subject  = 'Reminder Salesforce Ohana';
                t.status = 'Open';
                t.Priority = 'Normal';
                t.WhatId = opp.Id;
                t.OwnerId = opp.ownerId;
                Tasklist.add(t);
            }            
        }
        if(!taskList.isEmpty()){
            insert TaskList;
        }
    }
}