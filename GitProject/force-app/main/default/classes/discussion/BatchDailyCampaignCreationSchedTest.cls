@isTest
private class BatchDailyCampaignCreationSchedTest{
    static testMethod void testBatchDailyCampaignCreationSched() { 
        //时间随便写一下 未来100年后  模仿你之前参考的batch也行
        String cronExp = '0 0 0 2 24 ? 2122';
        Test.startTest();
        String jobId = System.schedule('BatchDailyCampaignCreationSched', cronExp, new BatchDailyCampaignCreationSched());
        Test.stopTest();

        cronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM cronTrigger WHERE id = :jobId];
        System.assertEquals(cronExp, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
    }
}
