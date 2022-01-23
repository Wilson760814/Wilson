public class Aura394Class {
	@auraEnabled 
    public static List<Account> getAccounts(){
        return [SELECT ID,Name,Phone,Industry, Website FROM ACCOUNT Where website!=null Limit 10];
    }
    

}