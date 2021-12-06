@isTest
public with sharing class SMSCalloutMock implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();

        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"status": "success"}');
        res.setStatus(200);

        return res;
    }
}
