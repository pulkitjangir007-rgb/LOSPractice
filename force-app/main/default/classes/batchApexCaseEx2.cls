public class batchApexCaseEx2 implements Database.Batchable<sObject>, Database.Stateful {
    
    // Instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Priority FROM Case WHERE Priority = null'
        );
    }
    
    public void execute(Database.BatchableContext bc, List<Case> caseList) {
        // Process each batch of records
        for (Case c : caseList) {
            c.Priority = 'Low';
            // Increment the instance member counter
            recordsProcessed = recordsProcessed + 1;
        }
        update caseList;
    }
    
    public void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed + ' records processed!');
    }
}