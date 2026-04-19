global class WeeklyGovernanceScheduler implements Schedulable, Database.AllowsCallouts {

    global void execute(SchedulableContext sc) {
        WeeklyGovernanceLimitService.executeWeeklyProcess();
    }
}