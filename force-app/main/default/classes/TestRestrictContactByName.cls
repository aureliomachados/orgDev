@isTest
public with sharing class TestRestrictContactByName {

    @isTest static void testRestrictContactByNameValid(){
        Contact c = new Contact();

        c.FirstName = 'Guedes';
        c.LastName = 'Aurélio';

        Test.startTest();
        Database.SaveResult result = Database.insert(c);
        Test.stopTest();

        System.assert(result.isSuccess());
    }
    
    @isTest static void testRestrictContactByName(){
        Contact c = new Contact();

        c.FirstName = 'Guedes';
        c.LastName = 'INVALIDNAME';

        try {
         insert c;
        } catch (Exception e) {
            System.assert(e.getMessage().contains('The last Name ' + c.LastName + ' is not allowed for DML'));
        }
    }
}
