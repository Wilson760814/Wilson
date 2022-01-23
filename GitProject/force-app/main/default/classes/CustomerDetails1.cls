public class CustomerDetails1 {
	@AuraEnabled
    public static Account getAccount(string strIndustry){ 
        return [SELECT ID,Name,Phone,Industry FROM ACCOUNT WHERE Industry =: strIndustry limit 1];    // 3 records
    }
}