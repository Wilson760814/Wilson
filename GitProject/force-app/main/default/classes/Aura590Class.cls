public class Aura590Class {
	@auraEnabled 
    public static List<Account> getAccounts(){
        return [SELECT ID,Name,Phone,Industry, Website FROM ACCOUNT ];
    }
    

}