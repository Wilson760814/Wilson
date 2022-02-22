global class BatchCreateCollectionCampaignScheduler implements Schedulable {
	global void execute(SchedulableContext sc) {
        BatchCreateCollectionCampaign collectionCampaign = new BatchCreateCollectionCampaign();
        Database.executeBatch(collectionCampaign, 100);
    }	
}