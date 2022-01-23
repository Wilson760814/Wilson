public class CustomerRegistrationClass1 {
	@auraEnabled
    public static string createAccount(Account acc){
        // Exception Handling.
        try{
            insert acc;
            	return acc.Id;
        }catch(exception e){
            return 'Exception:'+e.getMessage();
        }
    }
}