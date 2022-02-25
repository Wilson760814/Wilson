

@isTest
private class BatchDailyCampaignCreationTest  {
   
     // Data Setup
    @TestSetup
    static void createTestData() {

        // Campaign_Job__c Data Setup
        list<Campaign_Job__c> cJobList = new list<Campaign_Job__c>();
        for(Integer a = 0; a < 7; a++){
            Campaign_Job__c newJob = new Campaign_Job__c();
            cJobList.add(newJob);
          }
        insert cJobList;

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
                                                }

       
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
        
        // purecloud__PureCloud_Campaign_Setting__c Data Setup
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
                                                    'Practical Assistance Campaign Sort',                                                    
                                                } 

        list<purecloud__PureCloud_Campaign_Setting__c> cSettingList = new list<purecloud__PureCloud_Campaign_Setting__c>();
        for(Integer a = 0; a < 8; a++){
            purecloud__PureCloud_Campaign_Setting__c newSetting = new urecloud__PureCloud_Campaign_Setting__c;
            newSetting.name = schedName[a];
            newSetting.purecloud__Division__c = 'Home';
            newSched.purecloud__Dialing_Mode__c = 'Preview Dialing';
            newSched.purecloud__Caller_ID_Number__c = '119911';
            newSched.purecloud__Caller_ID_Name__c = 'CallerIDNameTest';
            newSched.purecloud__PureCloud_Script__c = scriptRecord.Id;
            newSched.purecloud__PureCloud_Queue__c= queueRecord.Id;
            cSettingList.add(newSetting);
          }
        insert cSettingList;

    // TestBody
    @isTest
    static void batchDailyCampaignDataTest() {
        test.startTest();
        BatchDailyCampaignCreation obj = new BatchDailyCampaignCreation();
        DataBase.executeBatch(obj, 100);
        test.stopTest();
        List<Campaign> CampaignFetch = [Select Id, Name, RecordtypeId, Event_Type__c, Campaign_Job__c, Domain__c, State__c, Type__c, StartDate, EndDate, LaunchDate__c, purecloud__PureCloud_Campaign_Schedule__c, purecloud__PureCloud_Campaign_Setting__c from Campaign ];
        System.AssertEquals(18, CampaignFetch.size());   
    }  
} 
        
/*    
    //List<Campaign> CampaignFetch = [Select Id, Hardship_Program__c from Task where Origin__c =:'Auto-Dialler'];
            //system.assert(!listTask.isEmpty()); 这儿写不清了：）需要每个字段都断言吗？ // 最好都加
            Date DateCreate = Date.valueOf((System.now()-1).format('DD-MM-YYYY'));
            List<Campaign> CampaignFetch1 = [Select Id, Name，Event_Type__c ,xxx  from Campaign where Domain__c =:'Hardship'];
            System.AssertEquals('WNVIC Res-Dialer 1-'+DateCreate + '-MSSAT',CampaignFetch1[0].Name);
            System.AssertEquals('Missed Payments',CampaignFetch1[0].Type);
            //xxxx 还有其他的 下面的也是类似
            List<Campaign> CampaignFetch2 = [Select Id, Name，Event_Type__c ,xxx  from Campaign where Domain__c =:'Collections'];
        }

        Campaign_Job__c cJob = new Campaign_Job__c();
        cJob.Name = 'CJ-0001';  //这里如果是auto number 那就不用赋值Name insert后会自动生成Name
        cJob.xxx = 'xx';
        //其他的必须字段
        insert cJob；



        // lookup那个object得API名 写在这创建
        purecloud__PureCloud_Campaign_Setting__c ppcs = new purecloud__PureCloud_Campaign_Setting__c();
        ppcs.Name = 'ppppp';
        cJob.xxx = 'xx';
        //其他的必须字段
        insert ppcs;

        Campaign CamTestData1 = new Campaign();  //变量名开头都是小写字母 你都用的大写 CamTestData1换成 camTestData1
                    RecordTypeId = CAMPAIGN_RECORD_TYPE_ID； //这个要提前加上
                    CamTestData1.Name ='WNVIC Res-Dialer 1';
                    //CamTestData1.Event_Type__c = '';
                    CamTestData1.Type = 'Missed Payments';
                    CamTestData1.Domain__c = 'Hardship';
                    CamTestData1.State__c = 'WA';
                    CamTestData1.Campaign_Job__c = cJob.Id; // 这个不能直接赋值 需要创建这个Campaign_Job__c得object 然后把id赋值
                     CamTestData1.purecloud__PureCloud_Campaign_Setting__c = ppcs.Id; //这里也是吧 记得是lookup得字段  也得提前创建那个objcet 然后取到id赋值
                    CamTestData1.purecloud__PureCloud_Campaign_Schedule__c = 'Missed Payment Campaign - NonWA';  //这个如果是不同得objcet 也和上面一样 需要提前创建 在赋值Id

        insert CamTestData1;

        // 和上面一样的修改
        Campaign  CamTestData2 = new Campaign()
                    CamTestData2.CamTestData1.Name ='WWA NonDiscon-Dialer3';
                    CamTestData2.Event_Type__c = 'Dialer 3 AH';
                    CamTestData2.Type = 'Collections Life Support';
                    CamTestData2.Domain__c = 'Collections';
                    CamTestData2.State__c = 'NSW;QLD;SA';
                    //CamTestData2.Campaign_Job__c = '';
                    CamTestData2.purecloud__PureCloud_Campaign_Setting__c = 'Missed Payment Campaign';
                    CamTestData2.purecloud__PureCloud_Campaign_Schedule__c = 'Collections-Mon-Fri-Non-WA-Attempt3';

        insert CamTestData2;

    }
     
   
}
*/