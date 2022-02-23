

@isTest
public class BatchDailyCampaignCreationTest  {
    
    @TestSetup
    static void createTestData() {
        Campaign  CamTestData1 = new Campaign()
                    CamTestData1.Name ='WNVIC Res-Dialer 1';
                    //CamTestData1.Event_Type__c = '';
                    CamTestData1.Type = 'Missed Payments';
                    CamTestData1.Domain__c = 'Hardship';
                    CamTestData1.State__c = 'WA';
                    CamTestData1.Campaign_Job__c = 'CJ-0001';
                    CamTestData1.purecloud__PureCloud_Campaign_Setting__c = 'Missed Payment Campaign';
                    CamTestData1.purecloud__PureCloud_Campaign_Schedule__c = 'Missed Payment Campaign - NonWA';

        insert CamTestData1;

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
     
    static testMethod void BatchDailyCampaignDataTest() {        
        test.startTest();
        BatchDailyCampaignCreation obj = new BatchDailyCampaignCreation();
        DataBase.executeBatch(obj);
        test.stopTest();
        //List<Campaign> CampaignFetch = [Select Id, Hardship_Program__c from Task where Origin__c =:'Auto-Dialler'];
        //system.assert(!listTask.isEmpty()); 这儿写不清了：）需要每个字段都断言吗？
    }
    }
}