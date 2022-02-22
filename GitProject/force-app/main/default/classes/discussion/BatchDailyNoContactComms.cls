/*
*    @Author          : Isidra Cruto
*    @Date Created    : 09 April 2021
*    Description      : CCF-3294 Batch for sending outbound voice campaigns No Contact Comms  
*/
public class BatchDailyNoContactComms implements Database.batchable<sObject> {
    
    public Database.QueryLocator start(Database.batchableContext bc) {
        date dateYesterday = date.today().addDays(-1);
        time tToday = Time.newInstance(0, 0, 0, 0);
        datetime dtYesterday = Datetime.newInstance(dateYesterday, tToday);
        String formattedDtYesterday = dtYesterday.format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'');
        String queryString = 'SELECT Id, Mobile_Number__c, Email, ContactId, Hardship_Program__c, Hardship_State__c, Hardship_Program__r.No_Contact_Comms_SMS_Message__c, Hardship_Program__r.No_Contact_Comms_Email_Message__c, Hardship_Program__r.No_Contact_Comms_Count__c FROM CampaignMember WHERE Hardship_State__c != \'WA\' AND No_Contact__c = TRUE AND CreatedDate = YESTERDAY';
        return Database.getQueryLocator(queryString);
    }
    
    public void execute(Database.BatchableContext bc, List<CampaignMember> cmList){
        BatchExecuteNoContactComms.executeBatch(cmList);
    }    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }

}