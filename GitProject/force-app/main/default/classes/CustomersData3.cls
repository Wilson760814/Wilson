public class CustomersData3 {
	@auraEnabled  
    public static List<wrapData> getAccounts(){
        List<wrapData> lstw = new List<wrapData>();
        for(Account objA : [SELECT id,Name,Phone,Industry FROM ACCOUNT limit 10]){
            wrapData objw = new wrapData();
            objw.accName = objA.Name;
            objw.accPhone = objA.Phone;
            objw.accIndustry = objA.Industry;
            lstw.add(objw);
        }
        return lstw; 
    }
    
    public class wrapData{
        @auraEnabled public string accName;
        @auraEnabled public string accPhone;
        @auraEnabled public string accIndustry;
    }
}