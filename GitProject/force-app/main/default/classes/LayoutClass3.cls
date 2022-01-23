public class LayoutClass3 {

	@auraEnabled 
    public static List<wrapData> getData(){
        List<wrapData> lstw = new List<wrapData>();
        List<Account> lstA = [SELECT ID,Name,Phone,Industry FROM ACCOUNT Limit 5]; // 5
        List<Contact> lstC = [SELECT ID,LastName,Email FROM Contact Limit 5]; // 2
        Integer count = 0;
        if(lstA.size() < lstC.size()){
            count = lstA.size();
        }else{
            count = lstC.size();
        }
        
        for(integer i=0;i<count;i++){
            wrapData objw = new wrapData();
            objw.accName = lstA[i].Name;
            objw.accPhone = lstA[i].Phone;
            objw.accIndustry = lstA[i].Industry;
            objw.conLastName = lstC[i].LastName;
            objw.conEmail = lstC[i].Email;
            lstw.add(objw);
        }
        return lstw;
    }
    
    
    public class wrapData{
        @auraEnabled public String accName;
        @auraEnabled public String accPhone;
        @auraEnabled public String accIndustry;
        @auraEnabled public String conLastName;
        @auraEnabled public String conEmail;
    }
}