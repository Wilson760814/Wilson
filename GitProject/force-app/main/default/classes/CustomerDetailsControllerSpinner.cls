public class CustomerDetailsControllerSpinner {
  @auraEnabled
    public static customerInfo SearchAccount(String strIndustry){
        customerInfo obj = new customerInfo();
        try{
            Account objA = new Account();
            objA = [SELECT ID,Name,Phone,Industry FROM ACCOUNT WHERE Industry =: strIndustry limit 1];            
            obj.accName = objA.Name;
            obj.accPhone = objA.Phone;
            obj.accIndustry = objA.Industry;
            obj.status = 'SUCCESS';
        }
        catch(Exception e){
            obj.status = 'Error:'+e.getMessage();
        }
        return obj; 
    }
    
    // wrapper class
    public class customerInfo{
       @auraEnabled public String accName;
       @auraEnabled public String accPhone;
       @auraEnabled public String accIndustry;
       @auraEnabled public String status;
    }
}