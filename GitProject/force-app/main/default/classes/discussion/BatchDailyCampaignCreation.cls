/*
*    @Author          : Dee Jay, Wilson Wei
*    @Date Created    : 23 Feb 2022
*    Description      :  Case Number 00522109, Daily Campaign Creation - AC1
*/

    
    public class BatchDailyCampaignCreation implements Database.batchable<sObject> {
        public Database.QueryLocator start(Database.batchableContext bc) {
            String queryString = 'SELECT Id, Name FROM purecloud__PureCloud_Campaign_Schedule__c';
            return Database.getQueryLocator(queryString);
        }
        public void execute(Database.BatchableContext bc, List<purecloud__PureCloud_Campaign_Schedule__c> listCSched){
            List<purecloud__PureCloud_Campaign_Setting__c> listCSetting = [SELECT Id, Name FROM purecloud__PureCloud_Campaign_Setting__c];
            List<Campaign_Jobs__c> listCJob = [SELECT Id, Name FROM Campaign_Jobs__c];
            Id outboundCampRecordId  = Schema.SObjectType.Campaign.getRecordTypeInfosByName().get('Outbound Campaign').getRecordTypeId();
            Map<String, purecloud__PureCloud_Campaign_Setting__c> mapCSetting = new Map<String, purecloud__PureCloud_Campaign_Setting__c>();
            Map<String, purecloud__PureCloud_Campaign_Schedule__c> mapCSched = new Map<String, purecloud__PureCloud_Campaign_Schedule__c>();
            Map<String, Campaign_Jobs__c> mapCSched = new Map<String, Campaign_Jobs__c>();
            DateTime dt = Datetime.now();
            String dateOutput = dt.format('dd-MM-yyyy');
            String dayOfWeek=dt.format('EEEE');

            List<Campaign> newCampaignList = new List<Campaign>();

            for(purecloud__PureCloud_Campaign_Setting__c cset: listCSetting){
                mapCSetting.put(cset.Name, cset);
            }
            for(purecloud__PureCloud_Campaign_Schedule__c csched: listCSched){
                mapCSched.put(csched.Name, csched);
            }
            for(Campaign_Jobs__c cjob: listCJob){
                mapCJobs.put(cjob.Name, cjob);
            }
            for(purecloud__PureCloud_Campaign_Setting__c csetting: listCSetting){
                if(csetting.Name == 'Missed Payment Campaign Sort'){
                    Campaign newCamp1 = new Campaign();
                    newCamp1.RecordtypeId = outboundCampRecordId;
                    newCamp1.Campaign_Job__c = mapCJobs.get('CJ-0000').Id;
                    newCamp1.Name = 'Missed Payments (Non-WA) - '+dateOutput;
                    newCamp1.Domain__c = 'Hardship';
                    newCamp1.State__c = 'ACT'+';'+'NSW'+';'+'NT'+';'+'QLD'+';'+'SA'+';'+'TAS'+';'+'VIC';
                    newCamp1.Type__c = 'Missed Payments';
                    newCamp1.StartDate = date.today();
                    newCam1.EndDate = date.today();
                    newCamp1.LaunchDate__c = date.today();
                    newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Missed Payment Campaign - NonWA').Id;
                    newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                    newCampaignList.add(newCamp1);
                    Campaign newCamp2 = new Campaign();
                    newCamp2.RecordtypeId = outboundCampRecordId;
                    newCamp2.Campaign_Job__c = mapCJobs.get('CJ-0001').Id;
                    newCamp2.Name = 'Missed Payments (WA) - '+dateOutput;
                    newCamp2.Domain__c = 'Hardship';
                    newCamp2.State__c = 'WA';
                    newCamp2.Type__c = 'Missed Payments';
                    newCamp2.StartDate = date.today();
                    newCamp2.EndDate = date.today();
                    newCamp2.LaunchDate__c = date.today();
                    newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Missed Payment Campaign - WA').Id;
                    newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                    newCampaignList.add(newCamp2);
                }
                if(csetting.Name == 'New Hardship Referral Campaign Sort'){
                    Campaign newCamp1 = new Campaign();
                    newCamp1.RecordtypeId = outboundCampRecordId;
                    newCamp1.Campaign_Job__c = mapCJobs.get('CJ-0002').Id;
                    newCamp1.Name = 'New Hardship Referral (Non-WA) - '+dateOutput;
                    newCamp1.Domain__c = 'Hardship';
                    newCamp1.State__c = 'ACT'+';'+'NSW'+';'+'NT'+';'+'QLD'+';'+'SA'+';'+'TAS'+';'+'VIC';
                    newCamp1.Type__c = 'New Hardship Referral';
                    newCamp1.StartDate = date.today();
                    newCamp1.EndDate = date.today();
                    newCamp1.LaunchDate__c = date.today();
                    newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('New Hardship Referral Campaign - NonWA').Id;
                    newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                    newCampaignList.add(newCamp1);
                    Campaign newCamp2 = new Campaign();
                    newCamp2.RecordtypeId = outboundCampRecordId;
                    newCamp2.Campaign_Job__c = mapCJobs.get('CJ-0003').Id;
                    newCamp2.Name = 'New Hardship Referral (WA) - '+dateOutput;
                    newCamp2.Domain__c = 'Hardship';
                    newCamp2.State__c = 'WA';
                    newCamp2.Type__c = 'New Hardship Referral';
                    newCamp2.StartDate = date.today();
                    newCamp2.EndDate = date.today();
                    newCamp2.LaunchDate__c = date.today();
                    newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('New Hardship Referral Campaign - WA').Id;
                    newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                    newCampaignList.add(newCamp2);
                }
                if(csetting.Name == 'Review Hardship Referral Campaign Sort'){
                    Campaign newCamp1 = new Campaign();
                    newCamp1.RecordtypeId = outboundCampRecordId;
                    newCamp1.Campaign_Job__c = mapCJobs.get('CJ-0005').Id;
                    newCamp1.Name = 'Review Hardship Referral (Non-WA) - '+dateOutput;
                    newCamp1.Domain__c = 'Hardship';
                    newCamp1.State__c = 'ACT'+';'+'NSW'+';'+'NT'+';'+'QLD'+';'+'SA'+';'+'TAS'+';'+'VIC';
                    newCamp1.Type__c = 'Review Hardship Referral';
                    newCamp1.StartDate = date.today();
                    newCamp1.EndDate = date.today();
                    newCamp1.LaunchDate__c = date.today();
                    newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Review Hardship Referral Campaign - NonWA').Id;
                    newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                    newCampaignList.add(newCamp1);
                    Campaign newCamp2 = new Campaign();
                    newCamp2.RecordtypeId = outboundCampRecordId;
                    newCamp2.Campaign_Job__c = mapCJobs.get('CJ-0006').Id;
                    newCamp2.Name = 'Review Hardship Referral (WA) - '+dateOutput;
                    newCamp2.Domain__c = 'Hardship';
                    newCamp2.State__c = 'WA';
                    newCamp2.Type__c = 'Review Hardship Referral';
                    newCamp2.StartDate = date.today();
                    newCamp2.EndDate = date.today();
                    newCamp2.LaunchDate__c = date.today();
                    newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Review Hardship Referral Campaign - WA').Id;
                    newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                    newCampaignList.add(newCamp2);
                }
                if(csetting.Name == 'Practical Assistance Campaign Sort'){
                    Campaign newCamp1 = new Campaign();
                    newCamp1.RecordtypeId = outboundCampRecordId;
                    newCamp1.Campaign_Job__c = mapCJobs.get('CJ-0004').Id;
                    newCamp1.Name = 'Practical Assistance (VIC) - '+dateOutput;
                    newCamp1.Domain__c = 'Hardship';
                    newCamp1.State__c = 'VIC';
                    newCamp1.Type__c = 'Practical Assistance';
                    newCamp1.StartDate = date.today();
                    newCamp1.EndDate = date.today();
                    newCamp1.LaunchDate__c = date.today();
                    newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Practical Assistance Campaign - VIC').Id;
                    newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                    newCampaignList.add(newCamp1);                    
                }
                if(string.valueof(dayOfWeek)=='Saturday'){
                    if(csetting.Name == 'Collection - Attempt 1 Sort'){
                        Campaign newCamp1 = new Campaign();
                        newCamp1.RecordtypeId = outboundCampRecordId;
                        newCamp1.Name = 'NVIC Res - Dialer 1 - '+dateOutput;
                        newCamp1.Domain__c = 'Collections';
                        newCamp1.State__c = 'NSW'+';'+'QLD'+';'+'SA';
                        newCamp1.Type__c = 'Collections Non VIC Res';
                        newCamp1.Event_Type__c = 'Dialer 1 BH';
                        newCamp1.StartDate = date.today();
                        newCamp1.EndDate = date.today();
                        newCamp1.LaunchDate__c = date.today();
                        newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - Non WA - Attempt 1').Id;
                        newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp1);
                        Campaign newCamp2 = new Campaign();
                        newCamp2.RecordtypeId = outboundCampRecordId;                        
                        newCamp2.Name = 'VIC & NVIC SME - Dialer 1 - '+dateOutput;
                        newCamp2.Domain__c = 'Collections';
                        newCamp2.State__c = 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC';
                        newCamp2.Type__c = 'Collections VIC SME and Non VIC SME';
                        newCamp2.Event_Type__c = 'Dialer 1 BH';
                        newCamp2.StartDate = date.today();
                        newCamp2.EndDate = date.today();
                        newCamp2.LaunchDate__c = date.today();
                        newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - Non WA - Attempt 1').Id;
                        newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp2);
                        Campaign newCamp3 = new Campaign();
                        newCamp3.RecordtypeId = outboundCampRecordId;                        
                        newCamp3.Name = 'VIC Res - Dialer 1 - '+dateOutput;
                        newCamp3.Domain__c = 'Collections';
                        newCamp3.State__c = 'VIC';
                        newCamp3.Type__c = 'Collections VIC Res';
                        newCamp3.Event_Type__c = 'Dialer 1 BH';
                        newCamp3.StartDate = date.today();
                        newCamp3.EndDate = date.today();
                        newCamp3.LaunchDate__c = date.today();
                        newCamp3.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - Non WA - Attempt 1').Id;
                        newCamp3.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp3);
                        Campaign newCamp4 = new Campaign();
                        newCamp4.RecordtypeId = outboundCampRecordId;                        
                        newCamp4.Name = 'WA Res & WA SME - Dialer 1 - '+dateOutput;
                        newCamp4.Domain__c = 'Collections';
                        newCamp4.State__c = 'WA';
                        newCamp4.Type__c = 'Collections WA Res & WA SME';
                        newCamp4.Event_Type__c = 'Dialer 1 BH';
                        newCamp4.StartDate = date.today();
                        newCamp4.EndDate = date.today();
                        newCamp4.LaunchDate__c = date.today();
                        newCamp4.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - WA - Attempt 1').Id;
                        newCamp4.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp4);
                    }
                    if(csetting.Name == 'Collection - Attempt 2 Sort'){
                        Campaign newCamp1 = new Campaign();
                        newCamp1.RecordtypeId = outboundCampRecordId;
                        newCamp1.Name = 'NVIC Res - Dialer 2 - '+dateOutput;
                        newCamp1.Domain__c = 'Collections';
                        newCamp1.State__c = 'NSW'+';'+'QLD'+';'+'SA';
                        newCamp1.Type__c = 'Collections Non VIC Res';
                        newCamp1.Event_Type__c = 'Dialer 2 AH';
                        newCamp1.StartDate = date.today();
                        newCamp1.EndDate = date.today();
                        newCamp1.LaunchDate__c = date.today();
                        newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - Non WA - Attempt 2').Id;
                        newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp1);
                        Campaign newCamp2 = new Campaign();
                        newCamp2.RecordtypeId = outboundCampRecordId;                        
                        newCamp2.Name = 'VIC & NVIC SME - Dialer 2 - '+dateOutput;
                        newCamp2.Domain__c = 'Collections';
                        newCamp2.State__c = 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC';
                        newCamp2.Type__c = 'Collections VIC SME and Non VIC SME';
                        newCamp2.Event_Type__c = 'Dialer 2 AH';
                        newCamp2.StartDate = date.today();
                        newCamp2.EndDate = date.today();
                        newCamp2.LaunchDate__c = date.today();
                        newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - Non WA - Attempt 2').Id;
                        newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp2);
                        Campaign newCamp3 = new Campaign();
                        newCamp3.RecordtypeId = outboundCampRecordId;                        
                        newCamp3.Name = 'VIC Res - Dialer 2 - '+dateOutput;
                        newCamp3.Domain__c = 'Collections';
                        newCamp3.State__c = 'VIC';
                        newCamp3.Type__c = 'Collections VIC Res';
                        newCamp3.Event_Type__c = 'Dialer 2 AH';
                        newCamp3.StartDate = date.today();
                        newCamp3.EndDate = date.today();
                        newCamp3.LaunchDate__c = date.today();
                        newCamp3.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - Non WA - Attempt 2').Id;
                        newCamp3.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp3);
                        Campaign newCamp4 = new Campaign();
                        newCamp4.RecordtypeId = outboundCampRecordId;                        
                        newCamp4.Name = 'WA Res & WA SME - Dialer 2 - '+dateOutput;
                        newCamp4.Domain__c = 'Collections';
                        newCamp4.State__c = 'WA';
                        newCamp4.Type__c = 'Collections WA Res & WA SME';
                        newCamp4.Event_Type__c = 'Dialer 2 AH';
                        newCamp4.StartDate = date.today();
                        newCamp4.EndDate = date.today();
                        newCamp4.LaunchDate__c = date.today();
                        newCamp4.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - WA - Attempt 2').Id;
                        newCamp4.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp4);
                    }
                    if(csetting.Name == 'Collection - Attempt 3 Sort'){
                        Campaign newCamp1 = new Campaign();
                        newCamp1.RecordtypeId = outboundCampRecordId;
                        newCamp1.Name = 'NWA NonDiscon - Dialer 3 - '+dateOutput;
                        newCamp1.Domain__c = 'Collections';
                        newCamp1.State__c = 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC';
                        newCamp1.Type__c = 'Collections Life Support';
                        newCamp1.Event_Type__c = 'Dialer 3 AH';
                        newCamp1.StartDate = date.today();
                        newCamp1.EndDate = date.today();
                        newCamp1.LaunchDate__c = date.today();
                        newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - Non WA - Attempt 3').Id;
                        newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp1);
                        Campaign newCamp2 = new Campaign();
                        newCamp2.RecordtypeId = outboundCampRecordId;                        
                        newCamp2.Name = 'WA NonDiscon - Dialer 3 - '+dateOutput;
                        newCamp2.Domain__c = 'Collections';
                        newCamp2.State__c = 'WA';
                        newCamp2.Type__c = 'Collections Life Support';
                        newCamp2.Event_Type__c = 'Dialer 3 AH';
                        newCamp2.StartDate = date.today();
                        newCamp2.EndDate = date.today();
                        newCamp2.LaunchDate__c = date.today();
                        newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - WA - Attempt 3').Id;
                        newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp2);
                    }
                }
                if(string.valueof(dayOfWeek)!='Saturday'||string.valueof(dayOfWeek)!='Sunday'){
                    if(csetting.Name == 'Collection - Attempt 1 Sort'){
                        Campaign newCamp1 = new Campaign();
                        newCamp1.RecordtypeId = outboundCampRecordId;
                        newCamp1.Name = 'NVIC Res - Dialer 1 - '+dateOutput;
                        newCamp1.Domain__c = 'Collections';
                        newCamp1.State__c = 'NSW'+';'+'QLD'+';'+'SA';
                        newCamp1.Type__c = 'Collections Non VIC Res';
                        newCamp1.Event_Type__c = 'Dialer 1 BH';
                        newCamp1.StartDate = date.today();
                        newCamp1.EndDate = date.today();
                        newCamp1.LaunchDate__c = date.today();
                        newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 1').Id;
                        newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp1);
                        Campaign newCamp2 = new Campaign();
                        newCamp2.RecordtypeId = outboundCampRecordId;                        
                        newCamp2.Name = 'VIC & NVIC SME - Dialer 1 - '+dateOutput;
                        newCamp2.Domain__c = 'Collections';
                        newCamp2.State__c = 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC';
                        newCamp2.Type__c = 'Collections VIC SME and Non VIC SME';
                        newCamp2.Event_Type__c = 'Dialer 1 BH';
                        newCamp2.StartDate = date.today();
                        newCamp2.EndDate = date.today();
                        newCamp2.LaunchDate__c = date.today();
                        newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 1').Id;
                        newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp2);
                        Campaign newCamp3 = new Campaign();
                        newCamp3.RecordtypeId = outboundCampRecordId;                        
                        newCamp3.Name = 'VIC Res - Dialer 1 - '+dateOutput;
                        newCamp3.Domain__c = 'Collections';
                        newCamp3.State__c = 'NSW'+';'+'QLD'+';'+'SA';
                        newCamp3.Type__c = 'Collections Non VIC Res';
                        newCamp3.Event_Type__c = 'Dialer 1 BH';
                        newCamp3.StartDate = date.today();
                        newCamp3.EndDate = date.today();
                        newCamp3.LaunchDate__c = date.today();
                        newCamp3.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 1').Id;
                        newCamp3.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp3);
                        Campaign newCamp4 = new Campaign();
                        newCamp4.RecordtypeId = outboundCampRecordId;                        
                        newCamp4.Name = 'WA Res & WA SME - Dialer 1 - '+dateOutput;
                        newCamp4.Domain__c = 'Collections';
                        newCamp4.State__c = 'WA';
                        newCamp4.Type__c = 'Collections WA Res & WA SME';
                        newCamp4.Event_Type__c = 'Dialer 1 BH';
                        newCamp4.StartDate = date.today();
                        newCamp4.EndDate = date.today();
                        newCamp4.LaunchDate__c = date.today();
                        newCamp4.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - WA - Attempt 1').Id;
                        newCamp4.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp4);
                    }
                    if(csetting.Name == 'Collection - Attempt 2 Sort'){
                        Campaign newCamp1 = new Campaign();
                        newCamp1.RecordtypeId = outboundCampRecordId;
                        newCamp1.Name = 'NVIC Res - Dialer 2 - '+dateOutput;
                        newCamp1.Domain__c = 'Collections';
                        newCamp1.State__c = 'NSW'+';'+'QLD'+';'+'SA';
                        newCamp1.Type__c = 'Collections Non VIC Res';
                        newCamp1.Event_Type__c = 'Dialer 2 AH';
                        newCamp1.StartDate = date.today();
                        newCamp1.EndDate = date.today();
                        newCamp1.LaunchDate__c = date.today();
                        newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 2').Id;
                        newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp1);
                        Campaign newCamp2 = new Campaign();
                        newCamp2.RecordtypeId = outboundCampRecordId;                        
                        newCamp2.Name = 'VIC & NVIC SME - Dialer 2 - '+dateOutput;
                        newCamp2.Domain__c = 'Collections';
                        newCamp2.State__c = 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC';
                        newCamp2.Type__c = 'Collections VIC SME and Non VIC SME';
                        newCamp2.Event_Type__c = 'Dialer 2 AH';
                        newCamp2.StartDate = date.today();
                        newCamp2.EndDate = date.today();
                        newCamp2.LaunchDate__c = date.today();
                        newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 2').Id;
                        newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp2);
                        Campaign newCamp3 = new Campaign();
                        newCamp3.RecordtypeId = outboundCampRecordId;                        
                        newCamp3.Name = 'VIC Res - Dialer 2 - '+dateOutput;
                        newCamp3.Domain__c = 'Collections';
                        newCamp3.State__c = 'NSW'+';'+'QLD'+';'+'SA';
                        newCamp3.Type__c = 'Collections Non VIC Res';
                        newCamp3.Event_Type__c = 'Dialer 2 AH';
                        newCamp3.StartDate = date.today();
                        newCamp3.EndDate = date.today();
                        newCamp3.LaunchDate__c = date.today();
                        newCamp3.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 2').Id;
                        newCamp3.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp3);
                        Campaign newCamp4 = new Campaign();
                        newCamp4.RecordtypeId = outboundCampRecordId;                        
                        newCamp4.Name = 'WA Res & WA SME - Dialer 2 - '+dateOutput;
                        newCamp4.Domain__c = 'Collections';
                        newCamp4.State__c = 'WA';
                        newCamp4.Type__c = 'Collections WA Res & WA SME';
                        newCamp4.Event_Type__c = 'Dialer 2 AH';
                        newCamp4.StartDate = date.today();
                        newCamp4.EndDate = date.today();
                        newCamp4.LaunchDate__c = date.today();
                        //Perhaps wrong in the referce doc of the next item
                        newCamp4.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Sat - WA - Attempt 2').Id;
                        //Perhaps wrong in the referce doc of the previous item
                        newCamp4.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp4);
                    }
                    if(csetting.Name == 'Collection - Attempt 3 Sort'){
                        Campaign newCamp1 = new Campaign();
                        newCamp1.RecordtypeId = outboundCampRecordId;
                        newCamp1.Name = 'NWA NonDiscon - Dialer 3 - '+dateOutput;
                        newCamp1.Domain__c = 'Collections';
                        newCamp1.State__c = 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC';
                        newCamp1.Type__c = 'Collections Life Support';
                        newCamp1.Event_Type__c = 'Dialer 3 AH';
                        newCamp1.StartDate = date.today();
                        newCamp1.EndDate = date.today();
                        newCamp1.LaunchDate__c = date.today();
                        newCamp1.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 3').Id;
                        newCamp1.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp1);
                        Campaign newCamp2 = new Campaign();
                        newCamp2.RecordtypeId = outboundCampRecordId;                        
                        newCamp2.Name = 'WA NonDiscon - Dialer 3 - '+dateOutput;
                        newCamp2.Domain__c = 'Collections';
                        newCamp2.State__c = 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC';
                        newCamp2.Type__c = 'Collections Life Support';
                        newCamp2.Event_Type__c = 'Dialer 3 AH';
                        newCamp2.StartDate = date.today();
                        newCamp2.EndDate = date.today();
                        newCamp2.LaunchDate__c = date.today();
                        newCamp2.purecloud__PureCloud_Campaign_Schedule__c = mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 3').Id;
                        newCamp2.purecloud__PureCloud_Campaign_Setting__c = csetting.Id;
                        newCampaignList.add(newCamp2);                        
                    }
                }
            }
            if(newCampaignList != NULL && !newCampaignList.isEmpty()){
                database.insert(newCampaignList, false);
            }
        }    
        public void finish(Database.BatchableContext bc){
            // execute any post-processing operations
        }
    }
    
    
    
    
