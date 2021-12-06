@isTest
public with sharing class AccountProcessorTest {
    @TestSetup
    static void makeData(){
       Account acc1 = new Account(Name='Guedes');
       Account acc2 = new Account(Name='Souza');

       insert acc1;
       insert acc2;

        
       Contact c1 = new Contact(LastName='Guedes Contact 1', AccountId=acc1.Id);
       Contact c2 = new Contact(LastName='Guedes Contact 2', AccountId=acc1.Id);
       Contact c3 = new Contact(LastName='Guedes Contact 3', AccountId=acc1.Id);
       Contact c4 = new Contact(LastName='Souza Contact 1', AccountId=acc2.Id);
       Contact c5 = new Contact(LastName='Souza Contact 2', AccountId=acc2.Id);

       insert c1;
       insert c2;
       insert c3;
       insert c4;
       insert c5;
    }

    @isTest
    public static void testCountContacts(){
        List<Id> accountIds = new List<Id>();


        for(Account acct : [select Id from Account]){
            accountIds.add(acct.Id);
        }

        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        List<Account> accountsWithNumberOfContacts = [select Id, Name, Number_Of_Contacts__c from Account];

        System.assertEquals(2, accountsWithNumberOfContacts.size());
        System.assertEquals(3, accountsWithNumberOfContacts.get(0).Number_Of_Contacts__c);
        System.assertEquals(2, accountsWithNumberOfContacts.get(1).Number_Of_Contacts__c);

    }
}
