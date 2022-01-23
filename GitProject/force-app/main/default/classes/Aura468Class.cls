public class Aura468Class {
@auraEnabled 
   
       public static Account getContacts(string idclass){
        System.debug('idclass= '+idclass);
       Account Acc = [SELECT Id, name, (select id,Firstname, Lastname, Email from contacts) from account where id=:idclass];
        List<Contact> MyContact=Acc.contacts;
       //System.debug('Mycontact= '+Mycontact);
       System.debug(Acc);
       System.debug(Acc.contacts);
       System.debug(MyContact);
        return Acc;
    }
}