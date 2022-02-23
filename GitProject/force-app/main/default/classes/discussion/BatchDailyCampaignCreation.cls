/*
*    @Author          : Wilson Wei
*    @Date Created    : 23 Feb 2022
*    Description      :  Case Number 00522109, Daily Campaign Creation - AC1
*/
public class BatchDailyCampaignCreation implements Database.batchable<sObject> {
    
    public Database.QueryLocator start(Database.batchableContext bc) {
        
        return Database.getQueryLocator(
            [
                SELECT  Id 
                        ,Name
                        ,RecordTypeId
                        ,Event_Type__c
                        ,Type
                        ,Domain__c
                        ,State__c
                        ,Campaign_Job__c
                        ,purecloud__PureCloud_Campaign_Setting__c
                        ,purecloud__PureCloud_Campaign_Schedule__c
                FROM Campaign 
                Where CreatedDate = YESTERDAY // Fetch yesterday data
            ]);  
            
        
    }
    
    public void execute(Database.BatchableContext bc, List<Campaign> campaignRawDatalist){

        List<Campaign> campaignNewList = new List<Campaign>();

        for(Campaign CamRaw : campaignRawDatalist){
            Campaign CamNew  = new Campaign();

                Date DateCreate = Date.valueOf((System.now()-1).format('DD-MM-YYYY'));
                // Campaign Id
                if(String.isNotEmpty(CamRaw.Id)){
                    CamNew.Id = CamRaw.Id;
                }
                // Campaign RecordTypeId
                if(String.isNotEmpty(CamRaw.RecordTypeId)){
                    CamNew.RecordTypeId = CamRaw.RecordTypeId;
                }
                // 注释都加上 下面也是 通常写label名
                if(String.isNotEmpty(CamRaw.Domain__c)){
                    CamNew.Domain__c = CamRaw.Domain__c;
                }

                if(String.isNotEmpty(CamRaw.State__c)){
                    CamNew.State__c = CamRaw.State__c;
                }
                
                if(String.isNotEmpty(CamRaw.Type)){
                    CamNew.Type = CamRaw.Type;
                }
            
                if(String.isNotEmpty(CamRaw.Event_Type__c)){
                    CamNew.Event_Type__c = CamRaw.Event_Type__c;
                }

                if(String.isNotEmpty(CamRaw.Campaign_Job__c)){
                    CamNew.Campaign_Job__c = CamRaw.Campaign_Job__c;
                }
                if(String.isNotEmpty(CamRaw.Campaign_Job__c)){
                    CamNew.purecloud__PureCloud_Campaign_Schedule__c = CamRaw.purecloud__PureCloud_Campaign_Schedule__c;
                }
                if(String.isNotEmpty(CamRaw.purecloud__PureCloud_Campaign_Setting__c)){
                    CamNew.purecloud__PureCloud_Campaign_Setting__c = CamRaw.purecloud__PureCloud_Campaign_Setting__c;
                }

                CamNew.Name = CamRaw.Name + '-'+ DateCreate+'-MSSAT';// Date modify
                CamNew.StartDate = DateCreate ;//Date modify
                CamNew.EndDate = DateCreate ;//Date modify
                CamNew.LaunchDate__c = DateCreate;//Date modify
                campaignNewList.add(CamNew);

        }

        if(0 < campaignNewList.size()) insert campaignNewList;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }

}
