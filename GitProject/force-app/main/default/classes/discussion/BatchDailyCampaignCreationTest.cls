

@isTest
private class BatchDailyCampaignCreationTest  {
    /** Campaign RecordTypeId */
    private static final Id CAMPAIGN_RECORD_TYPE_ID = Schema.getGlobalDescribe().get('Campaign').getDescribe().getRecordTypeInfosByDeveloperName().get('CampaignRecordType的API名').getRecordTypeId();

    @TestSetup
    static void createTestData() {


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
     
    static testMethod void BatchDailyCampaignDataTest() {     //方法名开头也是小写  
        test.startTest();
        BatchDailyCampaignCreation obj = new BatchDailyCampaignCreation();
        DataBase.executeBatch(obj，100);
        test.stopTest();
        //List<Campaign> CampaignFetch = [Select Id, Hardship_Program__c from Task where Origin__c =:'Auto-Dialler'];
        //system.assert(!listTask.isEmpty()); 这儿写不清了：）需要每个字段都断言吗？ // 最好都加
        Date DateCreate = Date.valueOf((System.now()-1).format('DD-MM-YYYY'));
        List<Campaign> CampaignFetch1 = [Select Id, Name，Event_Type__c ,xxx  from Campaign where Domain__c =:'Hardship'];
        System.AssertEquals('WNVIC Res-Dialer 1-'+DateCreate + '-MSSAT',CampaignFetch1[0].Name);
        System.AssertEquals('Missed Payments',CampaignFetch1[0].Type);
        //xxxx 还有其他的 下面的也是类似
        List<Campaign> CampaignFetch2 = [Select Id, Name，Event_Type__c ,xxx  from Campaign where Domain__c =:'Collections'];
    }
}