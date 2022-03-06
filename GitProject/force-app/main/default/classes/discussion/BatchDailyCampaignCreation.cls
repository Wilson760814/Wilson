/*
*    @Author          :  Wilson Wei
*    @Date Created    : 27 Feb 2022
*    Description      :  Case Number 00522109, Daily Campaign Creation - AC1
<<<<<<< HEAD
*/ 
 
=======
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
                if(string.valueof(dayOfWeek) != 'Saturday' && string.valueof(dayOfWeek)!='Sunday'){
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
    
    
    
    
    
  /*  
  public class BatchDailyCampaignCreation implements Database.batchable<sObject> {
>>>>>>> 685b7b2ada01596fcc81692cdf6c11b9c2fffe02
    
public class BatchDailyCampaignCreation implements Database.batchable<sObject> {
    public Database.QueryLocator start(Database.batchableContext bc) {
        String queryString = 'SELECT Id, Name FROM purecloud__PureCloud_Campaign_Schedule__c';
        return Database.getQueryLocator(queryString);
    }
    public void execute(Database.BatchableContext bc, List<purecloud__PureCloud_Campaign_Schedule__c> listCSched){
       
     // Got basic records of Setting, Schedule, job and date  
        List<purecloud__PureCloud_Campaign_Setting__c> listCSetting = [SELECT Id, Name FROM purecloud__PureCloud_Campaign_Setting__c];
        List<Campaign_Jobs__c> listCJob = [SELECT Id, Name FROM Campaign_Jobs__c ORDER BY CreatedDate ASC]; 
        
        Id outboundCampRecordId  = Schema.SObjectType.Campaign.getRecordTypeInfosByName().get('Outbound Campaign').getRecordTypeId();
        Map<String, purecloud__PureCloud_Campaign_Setting__c> mapCSetting = new Map<String, purecloud__PureCloud_Campaign_Setting__c>();
        Map<String, purecloud__PureCloud_Campaign_Schedule__c> mapCSched = new Map<String, purecloud__PureCloud_Campaign_Schedule__c>();
        Map<String, Campaign_Jobs__c> mapCJobs = new Map<String, Campaign_Jobs__c>();
        DateTime dt = Datetime.now();
        String dateOutput = dt.format('dd-MM-yyyy');
        String dayOfWeek=dt.format('EEEE'); 
        
        for(purecloud__PureCloud_Campaign_Setting__c cset: listCSetting){
            mapCSetting.put(cset.Name, cset);
        }
        for(purecloud__PureCloud_Campaign_Schedule__c csched: listCSched){
            mapCSched.put(csched.Name, csched);
        }
        for(Campaign_Jobs__c cjob: listCJob){
            mapCJobs.put(cjob.Name, cjob);
        }
    

    //hardship basic fields Data list create
        list<String> hardshipJobId = new list<String>{listCJob[0].Id, 
                                                      listCJob[1].Id, 
                                                      listCJob[2].Id, 
                                                      listCJob[3].Id, 
                                                      listCJob[5].Id,
                                                      listCJob[6].Id, 
                                                      listCJob[4].Id                                                        
                                                };
        list<String> hardshipSchedId = new list<String>{mapCSched.get('Missed Payment Campaign - NonWA').Id,
                                                        mapCSched.get('Missed Payment Campaign - WA').Id,
                                                        mapCSched.get('New Hardship Referral Campaign - NonWA').Id,
                                                        mapCSched.get('New Hardship Referral Campaign - WA').Id,
                                                        mapCSched.get('Review Hardship Referral Campaign - NonWA').Id,
                                                        mapCSched.get('Review Hardship Referral Campaign - WA').Id,
                                                        mapCSched.get('Practical Assistance Campaign - VIC').Id
                                                    };                                                                                                                                                
         list<String> hardshipSettingId = new list<String>{mapCSetting.get('Missed Payment Campaign Sort').Id,
                                                          mapCSetting.get('Missed Payment Campaign Sort').Id,
                                                          mapCSetting.get('New Hardship Referral Campaign Sort').Id,
                                                          mapCSetting.get('New Hardship Referral Campaign Sort').Id,
                                                          mapCSetting.get('Review Hardship Referral Campaign Sort').Id,
                                                          mapCSetting.get('Review Hardship Referral Campaign Sort').Id,
                                                          mapCSetting.get('Practical Assistance Campaign Sort').Id                                                       
                                                    };
        
        list<String> hardshipName = new list<String>();
        hardshipName.add('Missed Payments (Non-WA) - '+dateOutput+' - MSSAT'); 
        hardshipName.add('Missed Payments (WA) - '+dateOutput+' - MSSAT');                                                
        hardshipName.add('New Hardship Referral (Non-WA) - '+dateOutput+' - MSSAT');                                       
        hardshipName.add('New Hardship Referral (WA) - '+dateOutput+' - MSSAT'); 
        hardshipName.add('Review Hardship Referral (Non-WA) - '+dateOutput+' - MSSAT'); 
        hardshipName.add('Review Hardship Referral (WA) - '+dateOutput+' - MSSAT'); 
        hardshipName.add('Practical Assistance (VIC) - '+dateOutput+' - MSSAT'); 
        
        list<String> hardshipState = new list<String> (); 
        hardshipState.add( 'ACT'+';'+'NSW'+';'+'NT'+';'+'QLD'+';'+'SA'+';'+'TAS'+';'+'VIC'); 
        hardshipState.add( 'WA'); 
        hardshipState.add( 'ACT'+';'+'NSW'+';'+'NT'+';'+'QLD'+';'+'SA'+';'+'TAS'+';'+'VIC'); 
        hardshipState.add( 'WA'); 
        hardshipState.add( 'ACT'+';'+'NSW'+';'+'NT'+';'+'QLD'+';'+'SA'+';'+'TAS'+';'+'VIC'); 
        hardshipState.add( 'WA'); 
        hardshipState.add( 'VIC'); 

        list<String> hardshipType = new list<String>{'Missed Payment',
                                                     'Missed Payment',
                                                     'New Hardship Referral',
                                                     'New Hardship Referral', 
                                                     'Review Hardship Referral',
                                                     'Review Hardship Referral',
                                                     'Practical Assistance'     
                                                    };

        String hardshipDomain = 'Hardship';
        

 // collections WeekDay basic fields Data list create      
        list<String> collectionsWeekDayEventType = new list<String>{'Dialer 1 BH',
                                                                    'Dialer 2 AH',
                                                                    'Dialer 3 AH',
                                                                    'Dialer 1 BH',
                                                                    'Dialer 2 AH',
                                                                    'Dialer 1 BH',
                                                                    'Dialer 2 AH',
                                                                    'Dialer 3 AH',
                                                                    'Dialer 1 BH',
                                                                    'Dialer 2 AH'                                                                                                                                      
                                                                };
        list<String> collectionsWeekDaySchedId = new list<String>{mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 1').Id,
                                                                  mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 2').Id, 
                                                                  mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 3').Id,                 
                                                                  mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 1').Id,
                                                                  mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 2').Id, 
                                                                  mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 1').Id,  
                                                                  mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 2').Id, 
                                                                  mapCSched.get('Collections - Mon - Fri - Non WA - Attempt 3').Id,
                                                                  mapCSched.get('Collections - Mon - Fri - WA - Attempt 1').Id,
                                                                  mapCSched.get('Collections - Sat - WA - Attempt 2').Id //Should be checked with customer
                                                           };                
                                                                                                                                                                 
        list<String> collectionsWeekDaySettingId = new list<String>{mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 3 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 3 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id
                                                                };

        list<String> collectionsWeekDayName = new list<String>();
        collectionsWeekDayName.add('NVIC Res - Dialer 1 - '+dateOutput+' - MSSAT'); 
        collectionsWeekDayName.add('NVIC Res - Dialer 2 - '+dateOutput+' - MSSAT');                                                
        collectionsWeekDayName.add('NWA NonDiscon - Dialer 3 - '+dateOutput+' - MSSAT');                                       
        collectionsWeekDayName.add('VIC & NVIC SME -Dialer 1 - '+dateOutput+' - MSSAT'); 
        collectionsWeekDayName.add('VIC & NVIC SME -Dialer 2 - '+dateOutput+' - MSSAT'); 
        collectionsWeekDayName.add('VIC Res - Dialer 1 - '+dateOutput+' - MSSAT'); 
        collectionsWeekDayName.add('VIC Res - Dialer 2 - '+dateOutput+' - MSSAT'); 
        collectionsWeekDayName.add('WA NonDiscon - Dialer 3 - '+dateOutput+' - MSSAT'); 
        collectionsWeekDayName.add('WA Res & WA SME - Dialer 1 - '+dateOutput+' - MSSAT');  
        collectionsWeekDayName.add('WA Res & WA SME - Dialer 2 - '+dateOutput+' - MSSAT'); 

        list<String> collectionsWeekDayState = new list<String> (); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC'); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC'); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC'); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'); 
        collectionsWeekDayState.add( 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC'); 
        collectionsWeekDayState.add( 'WA'); 
        collectionsWeekDayState.add( 'WA'); 

        list<String> collectionsWeekDayType = new list<String>{'Collections Non VIC Res',
                                                               'Collections Non VIC Res',
                                                               'Collections Life Support',
                                                               'Collections VIC SME and Non VIC SME',
                                                               'Collections VIC SME and Non VIC SME',
                                                               'Collections Non VIC Res',
                                                               'Collections Non VIC Res',
                                                               'Collections Life Support',
                                                               'Collections WA Res and WA SME',
                                                               'Collections WA Res and WA SME'
                                                            };
                  
        
        String collectionsWeekDayDomain = 'Collections';
        
        
 // collections Weekend basic fields Data list create        
        list<String> collectionsWeekendEventType = new list<String>{'Dialer 1 BH',
                                                                    'Dialer 2 AH',
                                                                    'Dialer 3 AH',
                                                                    'Dialer 1 BH',
                                                                    'Dialer 2 AH',
                                                                    'Dialer 1 BH',
                                                                    'Dialer 2 AH',
                                                                    'Dialer 3 AH',
                                                                    'Dialer 1 BH',
                                                                    'Dialer 2 AH'   
                                                                };                                                                                                                                   
    
        list<String> collectionsWeekendSchedId = new list<String>{mapCSched.get('Collections - Sat - Non WA - Attempt 1').Id,
                                                                  mapCSched.get('Collections - Sat - Non WA - Attempt 2').Id, 
                                                                  mapCSched.get('Collections - Sat - Non WA - Attempt 3').Id,                 
                                                                  mapCSched.get('Collections - Sat - Non WA - Attempt 1').Id,
                                                                  mapCSched.get('Collections - Sat - Non WA - Attempt 2').Id, 
                                                                  mapCSched.get('Collections - Sat - Non WA - Attempt 1').Id,  
                                                                  mapCSched.get('Collections - Sat - Non WA - Attempt 2').Id, 
                                                                  mapCSched.get('Collections - Sat - WA - Attempt 3').Id,
                                                                  mapCSched.get('Collections - Sat - WA - Attempt 1').Id,
                                                                  mapCSched.get('Collections - Sat - WA - Attempt 2').Id
                                                            };             
                                                                                                                                       
        list<String> collectionsWeekendSettingId = new list<String>{mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 3 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 3 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 1 Sort').Id,
                                                                    mapCSetting.get('Collection - Attempt 2 Sort').Id
                                                                };

        list<String> collectionsWeekendName = new list<String> ();
        collectionsWeekendName.add('NVIC Res - Dialer 1 - '+dateOutput+' - MSSAT'); 
        collectionsWeekendName.add('NVIC Res - Dialer 2 - '+dateOutput+' - MSSAT');                                                
        collectionsWeekendName.add('NWA NonDiscon - Dialer 3 - '+dateOutput+' - MSSAT');                                       
        collectionsWeekendName.add('VIC & NVIC SME -Dialer 1 - '+dateOutput+' - MSSAT'); 
        collectionsWeekendName.add('VIC & NVIC SME -Dialer 2 - '+dateOutput+' - MSSAT'); 
        collectionsWeekendName.add('VIC Res - Dialer 1 - '+dateOutput+' - MSSAT'); 
        collectionsWeekendName.add('VIC Res - Dialer 2 - '+dateOutput+' - MSSAT'); 
        collectionsWeekendName.add('WA NonDiscon - Dialer 3 - '+dateOutput+' - MSSAT'); 
        collectionsWeekendName.add('WA Res & WA SME - Dialer 1 - '+dateOutput+' - MSSAT'); 
        collectionsWeekendName.add('WA Res & WA SME - Dialer 2 - '+dateOutput+' - MSSAT'); 

        list<String> collectionsWeekendState = new list<String> (); 
        collectionsWeekendState.add( 'NSW'+';'+'QLD'+';'+'SA'); 
        collectionsWeekendState.add( 'NSW'+';'+'QLD'+';'+'SA'); 
        collectionsWeekendState.add( 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC'); 
        collectionsWeekendState.add( 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC'); 
        collectionsWeekendState.add( 'NSW'+';'+'QLD'+';'+'SA'+';'+'VIC'); 
        collectionsWeekendState.add( 'VIC'); 
        collectionsWeekendState.add( 'VIC'); 
        collectionsWeekendState.add( 'WA'); 
        collectionsWeekendState.add( 'WA'); 
        collectionsWeekendState.add( 'WA'); 

        list<String> collectionsWeekendType = new list<String>{ 'Collections Non VIC Res',
                                                                'Collections Non VIC Res',
                                                                'Collections Life Support',
                                                                'Collections VIC SME and Non VIC SME',
                                                                'Collections VIC SME and Non VIC SME',
                                                                'Collections Non VIC Res',
                                                                'Collections Non VIC Res',
                                                                'Collections Life Support',
                                                                'Collections WA Res and WA SME',
                                                                'Collections WA Res and WA SME'
                                                            };

        String collectionsWeekendDomain = 'Collections';
      
    // Deploy 3 methods for 3 situation 
        if((string.valueof(dayOfWeek) != 'Saturday') && (string.valueof(dayOfWeek) != 'Sunday')){
        hardshipRecordsGenerate(outboundCampRecordId, hardshipJobId, hardshipSchedId, hardshipSettingId, hardshipName, hardshipState, hardshipType, hardshipDomain);
        collectionsWeekDayRecordsGenerate(outboundCampRecordId, collectionsWeekDayEventType, collectionsWeekDaySchedId, collectionsWeekDaySettingId, collectionsWeekDayName, collectionsWeekDayState, collectionsWeekDayType, collectionsWeekDayDomain);
        }
        
        if(string.valueof(dayOfWeek) == 'Saturday'){
            collectionsWeekendRecordsGenerate(outboundCampRecordId, collectionsWeekendEventType, collectionsWeekendSchedId, collectionsWeekendSettingId, collectionsWeekendName, collectionsWeekendState, collectionsWeekendType, collectionsWeekendDomain);
        }
    }

    // hardship Records create Method
    @TestVisible
    private void hardshipRecordsGenerate(Id recordId, 
                                        list<String> jobId,  
                                        list<String> schedId, 
                                        list<String> settingId, 
                                        list<String> name, 
                                        list<String> state, 
                                        list<String> type, 
                                        String domain
                                         ) {
        List<Campaign> newCampaignList = new List<Campaign>();
        for (Integer i = 0; i < 7; i++){
                Campaign newCamp = new Campaign();
                newCamp.RecordtypeId = recordId;
                newCamp.Campaign_Job__c = jobId[i]; 
                newCamp.purecloud__PureCloud_Campaign_Schedule__c = schedId[i];
                //Conflict with a trigger
                //newCamp.purecloud__PureCloud_Campaign_Setting__c = settingId[i];                
                newCamp.Name = name[i];
                newCamp.State__c = state[i];
                newCamp.Type = type[i];
                newCamp.Domain__c = domain;                   
                newCamp.StartDate = date.today();
                newCamp.EndDate = date.today();
                newCamp.LaunchDate__c = date.today();                    
                newCampaignList.add(newCamp);
          }
        try{if(0 < newCampaignList.size())
            dataBase.insert (newCampaignList, false);            
        }catch(exception e){
            system.debug('error'+e.getMessage());
        }
    }
   // collections WeekDay Records create Method 
  @TestVisible
    private void collectionsWeekDayRecordsGenerate(Id recordId, 
                                                    list<String> eventType,  
                                                    list<String> schedId, 
                                                    list<String> settingId, 
                                                    list<String> name, 
                                                    list<String> state, 
                                                    list<String> type, 
                                                    String domain
                                                ) {
        List<Campaign> newCampaignList = new List<Campaign>();
        for (Integer i = 0; i < 10; i++){
                Campaign newCamp = new Campaign();
                newCamp.RecordtypeId = recordId;
                newCamp.Event_Type__c = eventType[i];
                newCamp.StartDate = date.today();
                newCamp.purecloud__PureCloud_Campaign_Schedule__c = schedId[i];
                //Conflict with a trigger
                //newCamp.purecloud__PureCloud_Campaign_Setting__c = settingId[i];
                newCamp.Name = name[i];                   
                newCamp.State__c = state[i];
                newCamp.Type = type[i];
                newCamp.Domain__c = domain;                   
                newCamp.StartDate = date.today();
                newCamp.EndDate = date.today();
                newCamp.LaunchDate__c = date.today();                    
                newCampaignList.add(newCamp);
          }
        try{if(0 < newCampaignList.size())
            dataBase.insert (newCampaignList, false);            
        }catch(exception e){
            system.debug('error'+e.getMessage());
        }
    }

    // collections Weekend Records create Method 
   @TestVisible
    private void collectionsWeekendRecordsGenerate(Id recordId, 
                                                  list<String> eventType,  
                                                  list<String> schedId, 
                                                  list<String> settingId, 
                                                  list<String> name, 
                                                  list<String> state, 
                                                  list<String> type, 
                                                  String domain
                                                ) {
        List<Campaign> newCampaignList = new List<Campaign>();
                                
           for (Integer i = 0; i < 10; i++){                
                Campaign newCamp = new Campaign();
                newCamp.RecordtypeId = recordId;
                newCamp.Event_Type__c = eventType[i];
                newCamp.StartDate = date.today();
                newCamp.purecloud__PureCloud_Campaign_Schedule__c = schedId[i];
                //Conflict with a trigger
                //newCamp.purecloud__PureCloud_Campaign_Setting__c = settingId[i];
                newCamp.Name = name[i]; 
                newCamp.State__c = state[i];
                newCamp.Type = type[i];
                newCamp.Domain__c = domain;                   
                newCamp.StartDate = date.today();
                newCamp.EndDate = date.today();
                newCamp.LaunchDate__c = date.today();                    
                newCampaignList.add(newCamp); 
           }
          try{if(0 < newCampaignList.size())
            dataBase.insert (newCampaignList, false);            
        }catch(exception e){
            system.debug('error'+e.getMessage());
        }
    }

    public void finish(Database.BatchableContext bc){ 
        // execute any post-processing operations
    }
}