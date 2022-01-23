public class ContactCountController {
	@auraEnabled
    public static Integer returnCount(String accId){
        List<Contact> lstC =  [SELECT Id,AccountID From Contact WHERE AccountID =: accId];
        return lstC.size(); 
    } 
}