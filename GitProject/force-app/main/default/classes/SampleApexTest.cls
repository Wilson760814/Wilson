@isTest
private class SampleApexTest{
static testMethod void validateSampleApex() {
Contact c = new Contact(LastName='BMW', Test_Value__c=100000);

Test.startTest();
insert c;
Test.stopTest();

// Retrieve the record
c = [SELECT Test_Value__c FROM Contact WHERE Id =:c.Id];

// Test that the trigger correctly updated the price
System.assertEquals(90000, c.Test_Value__c);
}
}