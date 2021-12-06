@isTest
public with sharing class LeadProcessorTest {
    @TestSetup
    static void setup(){
        List<Lead> leadsToInsert = new List<Lead>();
        for (Integer i = 0; i < 10; i++) {
            Lead l = new Lead();

            l.FirstName = 'Aurélio ' + i;
            l.Company = 'Guedes It';
            l.LastName = 'Guedes ' + i;
            l.LeadSource = 'Web ' + i;

            leadsToInsert.add(l);
        }

        insert leadsToInsert;
    }

    @isTest
    static void testLeadProcessorUpdatingLeadSource(){
        Test.startTest();

        LeadProcessor leadProcessor = new LeadProcessor();

        Id batchId = Database.executeBatch(leadProcessor);

        Test.stopTest();

        System.assertEquals(10, [select count() from Lead where LeadSource='Dreamforce']);
    }
}
