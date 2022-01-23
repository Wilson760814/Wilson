public class NewCaseListController {
    public List<Case> getNewCases(){
        //List<Case> results = Database.query('SELECT Id,CaseNumber FROM Case where status=\'New\'');
        List<Case> results =[SELECT Id,CaseNumber FROM Case where status='New'];
        return results;
    }
}