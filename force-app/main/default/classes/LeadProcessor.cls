public with sharing class LeadProcessor implements Database.Batchable<SObject>, Database.stateful{
    public Integer recordsProccessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select Id, FirstName, LastName, LeadSource, Status from Lead');
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leads = new List<Lead>();
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
            recordsProccessed += 1;
        }

        update leads;
    }

    public void finish(Database.BatchableContext bc){
        System.debug(recordsProccessed + ' Leads proccessed!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        System.debug(job);
    }

}
