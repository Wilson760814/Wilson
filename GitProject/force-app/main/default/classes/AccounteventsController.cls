public class AccounteventsController {
	@auraEnabled
    public static String insertAccount(Account objA){
        try{
            insert objA;
            	return 'OK';
        }catch(Exception e){
            return 'Some error';
        }
    }
    
    @auraEnabled
    public static List<Account> QueryAccounts(){
        return [SELECT Id,Name,Phone,Industry FROM Account order by createddate desc limit 20];
    }
}