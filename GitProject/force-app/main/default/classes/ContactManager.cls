public with sharing class ContactManager {
    @auraEnabled(cacheable=true)
    public static List<Contact> getContact() {
        return[select Id, lastname, phone from Contact LIMIT 3];

    }
}
