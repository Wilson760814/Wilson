public class BatchDailyCampaignCreation implements Database.batchable<sObject> {
    
    public Database.QueryLocator start(Database.batchableContext bc) {
        String queryString = 'SELECT 
                              RecordTypeId, 
                              Campaign_job__c, 
                              State__c 
                         FROM HardshipProgram__c;
        return Database.getQueryLocator(queryString);
    }
    
    public void execute(Database.BatchableContext bc, List<Collection_Event__c> ceList){
        List<Campaign> upserList = new List<ceList>();
            for(Collection_Event__c col : ceList) {
                Service__c ser = new Service__c();