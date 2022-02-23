/*
*    @Author          : Wilson Wei
*    @Date Created    : 23 Feb 2022
*    Description      :  Case Number 00522109, Daily Campaign Creation - AC1
*/
public class BatchDailyCampaignCreation implements Database.batchable<sObject> {
    
    public Database.QueryLocator start(Database.batchableContext bc) {
        
        return Database.getQueryLocator(
            [
                SELECT  Id, 
                        Name,
                        RecordTypeId,
                        Event_Type__c,
                        Type,
                        Domain__c,
                        State__c,
                        Campaign_Job__c,
                        purecloud__PureCloud_Campaign_Setting__c,
                        purecloud__PureCloud_Campaign_Schedule__c
                FROM Campaign 
                Where CreatedDate = YESTERDAY // Fetch yesterday data
            ]);  
            
        
    }
    
    public void execute(Database.BatchableContext bc, List<Campaign> CampaignRawDatalist){
        List<Campaign> CampaignNewList = new List<Campaign>();
        for(Campaign CamRaw : CampaignRawDatalist){
            Campaign CamNew  = new Campaign();
            Date DateCreate = (System.TODAY()-1).format('DD-MM-YYYY');
            if(String.isNoEmpty(CamRaw.Domain__c))
            CamNew.Id = CamRaw.Id;
            CamNew.RecordTypeId = CamRaw.RecordTypeId;

            if(String.isNoEmpty(CamRaw.Domain__c)){
               CamNew.Domain__c = CamRaw.Domain__c;
            }

            if(String.isNoEmpty(CamRaw.State__c)){
               CamNew.State__c = CamRaw.State__c;
            }
            
            if(String.isNoEmpty(CamRaw.Type)){
                CamNew.Type = CamRaw.Type;
            }
         
            if(String.isNoEmpty(CamRaw.Event_Type__c)){
                CamNew.Event_Type__c = CamRaw.Event_Type__c;
            }
            
            CamNew.Campaign_Job__c = CamRaw.Campaign_Job__c;
            CamNew.purecloud__PureCloud_Campaign_Schedule__c = CamRaw.purecloud__PureCloud_Campaign_Schedule__c;
            CamNew.purecloud__PureCloud_Campaign_Setting__c = purecloud__PureCloud_Campaign_Setting__c;
            
            CamNew.Name = CamRaw.Name + '-'+ DateCreate;// Date modify
            CamNew.StartDate = DateCreate ;//Date modify
            CamNew.EndDate = DateCreate ;//Date modify
            CamNew.LaunchDate__c = DateCreate;//Date modify
            CampaignNewList.add(CamNew);

        }
        if(!listLog.isEmpty()) insert CampaignNewList;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
        
}
