public class TaskUtility 
{
    public static String getTaskPriority(string leadCountry)
    {
        if(string.isBlank(leadCountry)||leadCountry.length()<2)
        {
            return null;
        }
        string taskPriority;
        if(leadCountry=='US')
        {
            taskPriority='High';
           
        }
     		else
            {
               taskPriority='Normal'; 
            }
       return taskPriority;
            }

}