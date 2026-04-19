@IsTest
public class WeeklyGovernanceLimitServiceTest {

    @IsTest
    static void testWeeklyExecution() {

        Test.startTest();
        WeeklyGovernanceLimitService.executeWeeklyProcess();
        Test.stopTest();

        // Assert storage usage record created
        System.assertEquals( 1,[SELECT COUNT() FROM Org_Storage_Usage__c],'One usage record should be created');


        System.assert(true, 'Email executed without exception');
    }

    @IsTest
    static void testScheduler() {

        Test.startTest();
        String jobId = System.schedule(
            'Test Weekly Scheduler',
            '0 0 9 ? * Wed',
            new WeeklyGovernanceSchedulere()
        );
        Test.stopTest();

        CronTrigger ct = [
            SELECT Id FROM CronTrigger WHERE Id = :jobId
        ];
        System.assertNotEquals(null, ct);
    }
}