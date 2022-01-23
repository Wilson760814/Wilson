public class AccountDML {
	@auraEnabled
    public static String createAccount(Account objA){
        try{
            Insert objA;
            	return objA.Id; 
        }catch(Exception e){
            return 'error';
        }
    }
}