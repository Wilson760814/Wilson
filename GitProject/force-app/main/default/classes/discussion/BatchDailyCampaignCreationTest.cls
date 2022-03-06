@isTest
  private class BatchDailyCampaignCreationTest  {
  // Basic RecordTypeId and date data create   
     private static final Id recordIdTest = Schema.SObjectType.Campaign.getRecordTypeInfosByName().get('Outbound Campaign').getRecordTypeId();
     private static final DateTime dt = Datetime.now(); 
     private static final String dateOutput = dt.format('dd-MM-yyyy');
     private static final String dayOfWeek=dt.format('EEEE');      
    
    
     // Data Setup
    @TestSetup
    static void createTestData() {

<<<<<<< HEAD
        // Campaign_Jobs__c Data Setup
        list<Campaign_Jobs__c> cJobList = new list<Campaign_Jobs__c>();
        for(Integer a = 0; a < 7; a++){
            Campaign_Jobs__c newJob = new Campaign_Jobs__c();
            cJobList.add(newJob);
          }
        insert cJobList;
        List<Campaign_Jobs__c> job = [SELECT Id, Name FROM Campaign_Jobs__c];
        
=======
        // Campaign_Job__c Data Setup
        list<Campaign_Job__c> cJobList = new list<Campaign_Job__c>();
        for(Integer a = 0; a < 7; a++){
            Campaign_Job__c newJob = new Campaign_Job__c();
            cJobList.add(newJob);
          }
        insert cJobList;
>>>>>>> 685b7b2ada01596fcc81692cdf6c11b9c2fffe02

        // purecloud__PureCloud_Campaign_Schedule__c Data Setup
        list<String> schedName = new list<String>{'Collections - Mon - Fri - Non WA - Attempt 1', 
                                                  'Collections - Mon - Fri - Non WA - Attempt 2',
                                                  'Collections - Mon - Fri - Non WA - Attempt 3',
                                                  'Collections - Mon - Fri - WA - Attempt 1',
                                                  'Collections - Mon - Fri - WA - Attempt 2',
                                                  'Collections - Mon - Fri - WA - Attempt 3',
                                                  'Collections - Sat - Non WA - Attempt 1',
                                                  'Collections - Sat - Non WA - Attempt 2',
                                                  'Collections - Sat - Non WA - Attempt 3',
                                                  'Collections - Sat - WA - Attempt 1',
                                                  'Collections - Sat - WA - Attempt 2',
                                                  'Collections - Sat - WA - Attempt 3',
                                                  'Missed Payment Campaign - NonWA',
                                                  'Missed Payment Campaign - WA',
                                                  'New Hardship Referral Campaign - NonWA',
                                                  'New Hardship Referral Campaign - WA',
                                                  'Practical Assistance Campaign - VIC',
                                                  'Review Hardship Referral Campaign - NonWA',
                                                  'Review Hardship Referral Campaign - WA'
<<<<<<< HEAD
                                                };
=======
                                                }
>>>>>>> 685b7b2ada01596fcc81692cdf6c11b9c2fffe02

       
        list<purecloud__PureCloud_Campaign_Schedule__c> cSchedList = new list<purecloud__PureCloud_Campaign_Schedule__c>();
        for(Integer a = 0; a < 19; a++){
            purecloud__PureCloud_Campaign_Schedule__c newSched = new purecloud__PureCloud_Campaign_Schedule__c();
            newSched.name = schedName[a];
            newSched.purecloud__Days_of_the_Week__c = 'Monday';
            newSched.purecloud__Start_Time__c = '11:00';
            newSched.purecloud__End_Time__c = '12:00';
            cSchedList.add(newSched);
          }
        insert cSchedList;
        
        
        
        // purecloud__PureCloud_Campaign_Setting__c Data Setup, should create 2 lookup obj data first, 
        // the lookup objs are Script and Queue, so that can retrieve the lookup Id
        purecloud__PureCloud_Queue__c cQueue = new purecloud__PureCloud_Queue__c();
        cQueue.Name = 'cQueueNameTest';
        cQueue.purecloud__PureCloud_Queue_ID__c = 'PureCloudQueueIDTest';
        insert cQueue;

        purecloud__PureCloud_Script__c cScript = new purecloud__PureCloud_Script__c();
        cScript.Name = 'cScriptNameTest';
        cScript.purecloud__PureCloud_Name__c = 'PureCloudNameTest';
        cScript.purecloud__PureCloud_Script_ID__c = 'PureCloudScriptIDTest';
        insert cScript;

        List<purecloud__PureCloud_Queue__c> listPureCloudQueue = [SELECT Id, Name, purecloud__PureCloud_Queue_ID__c FROM purecloud__PureCloud_Queue__c];
        purecloud__PureCloud_Queue__c queueRecord = listPureCloudQueue[0];
        List<purecloud__PureCloud_Script__c> listPureCloudScript = [SELECT Id, Name, purecloud__PureCloud_Name__c, purecloud__PureCloud_Script_ID__c FROM purecloud__PureCloud_Script__c];
        purecloud__PureCloud_Script__c scriptRecord = listPureCloudScript[0];
        list<String> settingName = new list<String>{'Collection - Attempt 1 Sort', 
                                                    'Collection - Attempt 2 Sort',
                                                    'Collection - Attempt 3 Sort',
                                                    'Missed Payment Campaign Sort',
                                                    'New Hardship Referral Campaign Sort',
                                                    'Practical Assistance Campaign Sort',
                                                    'Review Hardship Referral Campaign Sort',
                                                    'Practical Assistance Campaign Sort'                                                    
                                                }; 

        list<purecloud__PureCloud_Campaign_Setting__c> cSettingList = new list<purecloud__PureCloud_Campaign_Setting__c>();
        for(Integer a = 0; a < 7; a++){ 
            purecloud__PureCloud_Campaign_Setting__c newSetting = new purecloud__PureCloud_Campaign_Setting__c();
            newSetting.Name = settingName[a];
            newSetting.purecloud__Division__c = 'Home';
<<<<<<< HEAD
            newSetting.purecloud__Dialing_Mode__c = 'Preview Dialing';
            newSetting.purecloud__Caller_ID_Number__c = '119911';
            newSetting.purecloud__Caller_ID_Name__c = 'CallerIDNameTest';
            newSetting.purecloud__PureCloud_Script__c = scriptRecord.Id;
            newSetting.purecloud__PureCloud_Queue__c= queueRecord.Id;
            cSettingList.add(newSetting); 
          }
        insert cSettingList;
                     
    }
=======
            newSched.purecloud__Dialing_Mode__c = 'Preview Dialing';
            newSched.purecloud__Caller_ID_Number__c = '119911';
            newSched.purecloud__Caller_ID_Name__c = 'CallerIDNameTest';
            newSched.purecloud__PureCloud_Script__c = scriptRecord.Id;
            newSched.purecloud__PureCloud_Queue__c= queueRecord.Id;
            cSettingList.add(newSetting);
          }
        insert cSettingList;
>>>>>>> 685b7b2ada01596fcc81692cdf6c11b9c2fffe02

    // TestBody- Main stream Test tests the whole batch and each subclass Test tests 3 methods to gain better cover rate. 
    //Main stream test
    @isTest
<<<<<<< HEAD
    public static void batchDailyCampaignDataTest() { 
=======
    static void batchDailyCampaignDataTest() {
>>>>>>> 685b7b2ada01596fcc81692cdf6c11b9c2fffe02
        test.startTest();
        BatchDailyCampaignCreation obj = new BatchDailyCampaignCreation();
        DataBase.executeBatch(obj, 100);
        test.stopTest();
        List<Campaign> CampaignFetch = [Select Id, Name, RecordtypeId, Event_Type__c, Campaign_Job__c, Domain__c, State__c, Type, StartDate, EndDate, LaunchDate__c, purecloud__PureCloud_Campaign_Schedule__c, purecloud__PureCloud_Campaign_Setting__c from Campaign ];
        if(string.valueof(dayOfWeek) == 'Saturday'){
            System.AssertEquals(10, CampaignFetch.size());} 
        if((string.valueof(dayOfWeek) != 'Saturday') && (string.valueof(dayOfWeek) != 'Sunday')){
            System.AssertEquals(17, CampaignFetch.size());} 
    }  
   //hardship Method test
   @isTest
     public static void hardshipRecordsGenerateTest() {
        Id schedId = [SELECT Id FROM purecloud__PureCloud_Campaign_Schedule__c limit 1].Id;
        list<String> SchedIdTest= new list<String>{schedId};
        Id settingId = [SELECT Id FROM purecloud__PureCloud_Campaign_Setting__c limit 1].Id;
        list<String> SettingIdTest = new list<String>{settingId};
        Id JobId = [SELECT Id FROM Campaign_Jobs__c limit 1].Id;
        list<String> hardshipJobId= new list<String>{JobId};        
        list<String> hardshipName= new list<String>{'Missed Payments (Non-WA)'};  
        list<String> hardshipState= new list<String>{'WA'};  
        list<String> hardshipType= new list<String>{'Missed Payment'};
        String hardshipDomain = 'Hardship'; 
        test.startTest();
        BatchDailyCampaignCreation obj = new BatchDailyCampaignCreation();
         try{
            obj.hardshipRecordsGenerate(recordIdTest, hardshipJobId, SchedIdTest, SettingIdTest, hardshipName, hardshipState, hardshipType, hardshipDomain); 
         }catch(exception e){
            system.debug('error'+e.getMessage());
        }
        
        
        test.stopTest();        
    } 
    //collections WeekDay Method test
    @isTest
     public static void collectionsWeekDayRecordsGenerateTest() {
        Id schedId = [SELECT Id FROM purecloud__PureCloud_Campaign_Schedule__c limit 1].Id;
        list<String> SchedIdTest= new list<String>{schedId};
        Id settingId = [SELECT Id FROM purecloud__PureCloud_Campaign_Setting__c limit 1].Id;
        list<String> SettingIdTest = new list<String>{settingId};
        list<String> collectionsWeekDayeventType= new list<String>{'Dialer 1 BH'};       
        list<String> collectionsWeekDayName= new list<String>{'NVIC Res - Dialer 1'};  
        list<String> collectionsWeekDayState= new list<String>{'NSW'+';'+'QLD'+';'+'SA'};  
        list<String> collectionsWeekDayType= new list<String>{'Collections Non VIC Res'};
        String collectionsWeekDayDomain = 'Collections';  
        test.startTest();
        BatchDailyCampaignCreation obj = new BatchDailyCampaignCreation();
        try{
          obj.collectionsWeekDayRecordsGenerate(recordIdTest, collectionsWeekDayEventType, SchedIdTest, SettingIdTest, collectionsWeekDayName, collectionsWeekDayState, collectionsWeekDayType, collectionsWeekDayDomain);             
         }catch(exception e){
            system.debug('error'+e.getMessage());
        }
         test.stopTest();
    } 
    //collections Weekend Method test
     @isTest
     public static void collectionsWeekendRecordsGenerateTest() { 
        Id schedId = [SELECT Id FROM purecloud__PureCloud_Campaign_Schedule__c limit 1].Id;
        list<String> SchedIdTest= new list<String>{schedId};
        Id settingId = [SELECT Id FROM purecloud__PureCloud_Campaign_Setting__c limit 1].Id;
        list<String> SettingIdTest = new list<String>{settingId};
        list<String> collectionsWeekendeventType= new list<String>{'Dialer 1 BH'};       
        list<String> collectionsWeekendName= new list<String>{'NVIC Res - Dialer 1'};  
        list<String> collectionsWeekendState= new list<String>{'NSW'+';'+'QLD'+';'+'SA'};  
        list<String> collectionsWeekendType= new list<String>{'Collections Non VIC Res'};
        String collectionsWeekendDomain = 'Collections';  
        test.startTest();
        BatchDailyCampaignCreation obj = new BatchDailyCampaignCreation();
        try{
           obj.collectionsWeekendRecordsGenerate(recordIdTest, collectionsWeekendEventType, SchedIdTest, SettingIdTest, collectionsWeekendName, collectionsWeekendState, collectionsWeekendType, collectionsWeekendDomain);             
         }catch(exception e){
            system.debug('error'+e.getMessage());
        }
         test.stopTest(); 
    } 
}