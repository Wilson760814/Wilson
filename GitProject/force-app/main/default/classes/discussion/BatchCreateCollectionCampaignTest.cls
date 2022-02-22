/*
*    @Author          : Isidra Cruto
*    @Date Created    : 31 May 2021
*    Description      : CCF-4068 add members to collections case test class
*/
@isTest
public class BatchCreateCollectionCampaignTest {
    @testsetup 
    static void testData() {
        
            Account acc = TestDataFactory.createAcc('Test Acc');
            acc.MarketingMedia__c = 'Post';
        	acc.Collection_Journey__c = 'TestCollJourney';
            insert acc;

            list<account> baList = new list<account>();
            Account Billacc1 = TestDataFactory.createBillingAcc('Test Billing Acc', acc);
            Billacc1.Balance__c = -500.00;
            Billacc1.PaymentMethod__c = 'Manual Payment';
            Billacc1.PaymentAmount__c = 300 ;
            Billacc1.MarketingMedia__c = 'Post';
            insert baList;
        
        	Id conRectype = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('CustomerContact').getRecordTypeId();
            Contact con = new Contact();
            con.ExternalContactId__c = '1234';
        	con.AccountId = acc.Id;
        	con.FirstName = 'test';
        	con.LastName = 'collections contact';
        	con.Salutation = 'MR';
        	con.Email = 'testcollections@testmail.com';
        	con.RecordTypeId = conRectype;
        	con.MobilePhone = '0400000000';
            insert con;
        
        	//create collection event settings
        	List<Collection_Event_Setting__c> cesList = new List<Collection_Event_Setting__c>();
        	Collection_Event_Setting__c ces1 = new Collection_Event_Setting__c();
        	ces1.Collection_Journey_Name__c = 'TestCollJourney';
        	ces1.Event_Type__c = 'Dialer 1 BH';
        	ces1.Sequence_Number__c = 1;
        	cesList.add(ces1);
        	Collection_Event_Setting__c ces2 = new Collection_Event_Setting__c();
        	ces2.Collection_Journey_Name__c = 'TestCollJourney';
        	ces2.Event_Type__c = 'Dialer 2 AH';
        	ces2.Sequence_Number__c = 2;
        	cesList.add(ces2);
        	Collection_Event_Setting__c ces3 = new Collection_Event_Setting__c();
        	ces3.Collection_Journey_Name__c = 'TestCollJourney';
        	ces3.Event_Type__c = 'Dialer 3 AH';
        	ces3.Sequence_Number__c = 3;
        	cesList.add(ces3);
        	insert cesList;
        
        	List<Case> finalList = new List<Case>();
            List<Case> caselist1 = TestDataFactory.createCase('Collections', Billacc1, con, 1,acc, true);
            caseList1[0].subject = 'Collections1';
        	caseList1[0].Account = con.Account;
            caseList1[0].Status = 'New';
        	caseList1[0].State__c = 'VIC';
            finalList.add(caselist1[0]);
            insert finalList;
        
        Id campaignRecTypeId = Schema.SObjectType.Campaign.getRecordTypeInfosByDeveloperName().get('Outbound_Campaign').getRecordTypeId();
        Campaign cmp = new Campaign(); 
        cmp.Name = 'TEST Collection Campaign';
        cmp.StartDate = Date.today();
        cmp.EndDate = Date.today();
        cmp.LaunchDate__c = Date.today();
        cmp.Type = 'Collections VIC Res';
        cmp.Event_Type__c = 'Dialer 1 BH';
        cmp.Status = 'Monitoring';
        cmp.Domain__c = 'Collections';
        cmp.State__c = 'VIC';
        cmp.RecordTypeId = campaignRecTypeId;
        insert cmp;
    }
    
    static testmethod void createCMpositive(){
        test.startTest();
        List<Collection_Event__c> ceList = [SELECT Id, Name, Status__c, Customer__c,Case__r.ContactId,Planned_Date__c, Campaign_Type__c, Event_Type__c FROM Collection_Event__c WHERE Event_Type__c =: 'Dialer 1 BH'];
        ceList[0].Status__c = 'Scheduled';
        ceList[0].Planned_Date__c = date.today();
        ceList[0].Campaign_Type__c = 'Collections VIC Res';
        update ceList;
        BatchCreateCollectionCampaign obj = new BatchCreateCollectionCampaign();
        DataBase.executeBatch(obj);
        test.stopTest();
        List<Campaign> result = [SELECT Id FROM Campaign WHERE Name = 'TEST Collection Campaign' LIMIT 1];
        List<CampaignMember> cm = [SELECT Id, Mobile_Number__c, Other_Phone__c, CampaignId FROM CampaignMember WHERE CampaignId =: result[0].Id LIMIT 1];
        System.assert(!result.isEmpty());
        System.assertEquals('0400000000', cm[0].Mobile_Number__c);
        System.assertEquals(null, cm[0].Other_Phone__c);
        system.assert(!ceList.isEmpty());
    }
    
    static testmethod void createCMnegative(){
        test.startTest();
        List<Collection_Event__c> ceList = [SELECT Id, Name, Status__c, Customer__c,Case__r.ContactId,Planned_Date__c, Campaign_Type__c, Event_Type__c FROM Collection_Event__c WHERE Event_Type__c =: 'Dialer 1 BH'];
        BatchCreateCollectionCampaign obj = new BatchCreateCollectionCampaign();
        DataBase.executeBatch(obj);
        test.stopTest();
        List<Campaign> result = [SELECT Id FROM Campaign WHERE Name = 'TEST Collection Campaign' LIMIT 1];
        List<CampaignMember> cm = [SELECT Id, Mobile_Number__c, Other_Phone__c, CampaignId FROM CampaignMember WHERE CampaignId =: result[0].Id LIMIT 1];
        System.assert(cm.isEmpty());
    }
}