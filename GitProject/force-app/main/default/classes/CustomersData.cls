public class CustomersData {
	@auraEnabled 
    public static List<Account> getAccounts(){
        return [SELECT id,Name,Phone,Industry FROM ACCOUNT limit 10];
    }
}