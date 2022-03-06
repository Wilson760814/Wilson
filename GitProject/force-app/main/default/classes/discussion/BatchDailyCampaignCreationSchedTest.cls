@isTest
private class BatchDailyCampaignCreationSchedTest{
    static testMethod void TestBatchDailyCampaignCreationSched() { 
        String cronExp = '0 0 10 * * ?';
        Test.startTest();
        String jobId = System.schedule('BatchDailyCampaignCreationSched', cronExp, new BatchDailyCampaignCreationSched());
        Test.stopTest();

        cronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM cronTrigger WHERE id = :jobId];
        System.assertEquals(cronExp, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
    }
}
