public class LayoutClass {
	@auraEnabled 
    public static List<Account> getAccounts(){
        return [SELECT ID,Name,Phone,Industry FROM ACCOUNT Limit 5];
    }
    
    @auraEnabled
    public static List<Contact> getContacts(){
        return [SELECT ID,LastName,Email FROM Contact Limit 5];
    }
}