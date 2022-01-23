@isTest
public class TaskUtilityTest {
     @isTest static void testGetHighPriority()
    {
        String priority= TaskUtility.getTaskPriority('US');
        system.assertEquals('High', priority, 'High');
        system.debug(priority);
    }
      @isTest static void testGetNormalPriority()
    {
        String priority= TaskUtility.getTaskPriority('AUS');
        system.assertEquals('Normal', priority,'Normal');
        system.debug(priority);
    }
      @isTest static void testGetNullPriority()
    {
        String priority= TaskUtility.getTaskPriority('A');
        system.assertEquals(Null, priority,'Null');
        system.debug(priority);
    }
}