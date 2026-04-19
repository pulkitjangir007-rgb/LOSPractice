public class ProjectACVHandler {

    // Called from Case trigger
    public static void updateProjectsFromCases(List<Case> casesList) {
        Set<Id> projectIds = new Set<Id>();
        for (Case c : casesList) {
            if (c.Project__c != null) {
                projectIds.add(c.Project__c);
            }
        }
        if (!projectIds.isEmpty()) {
            recalculateACV(projectIds);
        }
    }

    // Called from Account trigger
    public static void updateProjectsFromAccounts(List<Account> newList, Map<Id, Account> oldMap) {
        Set<Id> changedAccounts = new Set<Id>();

        for (Account acc : newList) {
            Account oldAcc = oldMap.get(acc.Id);
            if (acc.ACV__c != oldAcc.ACV__c) {
                changedAccounts.add(acc.Id);
            }
        }

        if (!changedAccounts.isEmpty()) {
            Set<Id> projectIds = new Set<Id>();
            for (Case c : [
                SELECT Project__c
                FROM Case
                WHERE AccountId IN :changedAccounts
                AND Project__c != null
            ]) {
                projectIds.add(c.Project__c);
            }

            if (!projectIds.isEmpty()) {
                recalculateACV(projectIds);
            }
        }
    }

    // Core recalculation logic
    public static void recalculateACV(Set<Id> projectIds) {
        if (projectIds.isEmpty()) return;

        // Get Accounts linked to Projects via Cases
        Map<Id, Set<Id>> projectToAccounts = new Map<Id, Set<Id>>();
        for (Case c : [
            SELECT Project__c, AccountId
            FROM Case
            WHERE Project__c IN :projectIds
            AND AccountId != null
        ]) {
            if (!projectToAccounts.containsKey(c.Project__c)) {
                projectToAccounts.put(c.Project__c, new Set<Id>());
            }
            projectToAccounts.get(c.Project__c).add(c.AccountId);
        }

        // Get ACV values
        Set<Id> accIds = new Set<Id>();
        for (Set<Id> ids : projectToAccounts.values()) accIds.addAll(ids);

        Map<Id, Decimal> accToACV = new Map<Id, Decimal>();
        for (Account a : [SELECT Id, ACV__c FROM Account WHERE Id IN :accIds]) {
            accToACV.put(a.Id, a.ACV__c);
        }

        List<Project__c> updates = new List<Project__c>();

        for (Id projId : projectToAccounts.keySet()) {
            Decimal total = 0;
            for (Id accId : projectToAccounts.get(projId)) {
                if (accToACV.containsKey(accId) && accToACV.get(accId) != null) {
                    total += accToACV.get(accId);
                }
            }

            updates.add(new Project__c(
                Id = projId,
                Total_Related_Accounts_ACV__c = total
            ));
        }

        if (!updates.isEmpty()) {
            update updates;
        }
    }
}