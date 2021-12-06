public with sharing class AccountProcessor {

    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> acctToUpdate = new List<Account>();
        for (Id id : accountIds) {

           Integer numberOfContacts = [select COUNT() from Contact WHERE AccountId=:id];

           Account acc = [select Id, Name from Account WHERE Id=:id];
           acc.Number_Of_Contacts__c = numberOfContacts;
           
           acctToUpdate.add(acc);
        }
        if(acctToUpdate.size() > 0){
            update acctToUpdate;
        }
    }
}
