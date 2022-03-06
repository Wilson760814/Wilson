global class BatchDailyCampaignCreationSched implements Schedulable {
	global void execute(SchedulableContext sc) {
        BatchDailyCampaignCreation CampaignAutoBatch = new BatchDailyCampaignCreation(); 
        Database.executeBatch(CampaignAutoBatch, 100);
    }	
}
