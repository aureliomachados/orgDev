@isTest
public with sharing class TestVerifyDate {
    
    @isTest static void verifyDateBetweenNext30Dates(){
    
        Date today = Date.today();

    Date dateAfter15Days = Date.today().addDays(15);

    Date dateToCheck = VerifyDate.CheckDates(today, dateAfter15Days);

    System.assertEquals(dateAfter15Days, dateToCheck);
    }

    @isTest static void verifyDateIsntBetweenNext30Dates(){
        Date today = Date.today();

        Date dateAfter30Days = Date.today().addMonths(1);

        Date dateToCheck = VerifyDate.CheckDates(today, dateAfter30Days);

        System.assertEquals(Date.today().addMonths(1).toStartOfMonth().addDays(-1), dateToCheck);
    }
}
