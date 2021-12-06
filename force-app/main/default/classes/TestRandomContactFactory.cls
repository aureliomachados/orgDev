@isTest
public with sharing class TestRandomContactFactory {
    
    @isTest static void testCreateRandomContacts(){

        List<Contact> contacts = RandomContactFactory.generateRandomContacts(3, 'Guedes');

        System.assertEquals(3, contacts.size());
        System.assertEquals('Guedes 0', contacts[0].LastName);
        System.assert(contacts instanceof List<Contact>);
    }
}
