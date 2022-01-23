public class RecentDataController {
	@auraEnabled
    public static List<Sobject> get10Records(String objName){
        string strQuery = 'SELECT ID,Name FROM '+objName+' ORDER BY CreatedDate DESC LIMIT 10';
        // SELECT ID,Name FROM Sobject ORDER BY CreatedDate DESC Limit 10
        return database.Query(strQuery); 
    }
}