@isTest
private class Test_SMSUtils {
    @isTest 
    private static void testSendSms(){
        Test.setMock(HttpCalloutMock.class, new SMSCalloutMock());

        Test.startTest();

        SMSUtils.sendSms('111', '222', 'Greetings!');
        Test.stopTest();

        List<SMS_Log__c> logs = [select msg__c from SMS_Log__c];
        System.assertEquals(1, logs.size());
        System.assertEquals('success', logs[0].msg__c);
    }
}
