public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        /*
            return [
                select FirstName, LastName, Email from Contact WITH SECURITY_ENFORCED order by LastName
            ];
            */
            throw new AuraHandledException('Forced error on ContactController');
    }
}