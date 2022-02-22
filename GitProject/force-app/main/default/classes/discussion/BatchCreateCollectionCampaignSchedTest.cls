@isTest
private class BatchCreateCollectionCampaignSchedTest {
    private testmethod static void TestBatchCreateCollectionCampaignSched(){
        Test.startTest();
        String cron = '0 0 11 * * ?';     
        String jobid = System.schedule('testBatchCreateCollectionCampaignSched', cron, new BatchCreateCollectionCampaignScheduler());
        Test.stopTest();
		CronTrigger ct = [Select id , CronExpression from CronTrigger where id = :jobId];
        System.assertEquals(cron,ct.CronExpression); 
	}
}