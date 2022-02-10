public with sharing class ContactManager1 {
    @auraEnabled(cacheable=true)
    public static List<Contact> getContact(Integer numberOfRecords) {
        return[select Id, lastname, phone from Contact LIMIT:numberOfRecords];

    }
}
