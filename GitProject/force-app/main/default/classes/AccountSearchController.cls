public class AccountSearchController {
 	@auraEnabled
    public static List<Account> getAccounts(String searchparam){
        return [SELECT Id,Name,Phone,Industry FROM Account WHERE Industry =: searchparam];
    }
}