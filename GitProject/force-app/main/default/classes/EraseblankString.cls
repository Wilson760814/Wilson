public class EraseblankString {
Public static string ResultNumber;
Public static string Result(string Phonenumber)
     {
        return Phonenumber(Phonenumber);
     }
  
     Private static String PhoneNumber(String num) 
    {
         ResultNumber=num.replace(' ', '');
         system.debug('The Original one is:'+'  '+num); 
         system.debug('The result is:'+'  '+ResultNumber); 
         Return ResultNumber;
       }
}