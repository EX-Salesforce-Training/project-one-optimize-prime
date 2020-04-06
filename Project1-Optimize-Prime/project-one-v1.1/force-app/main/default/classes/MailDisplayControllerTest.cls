@isTest
public with sharing class MailDisplayControllerTest {
    @TestSetup
    private static void CreateMail(){
        Mail__c mailObj = new Mail__c();
        Address__c custAddr = new Address__c();
        
        mailObj.Delivery_Status__c = 'Processing';
        mailObj.Package_Value__c = 2500.50;
        mailObj.Width__c = 15;
        mailObj.Height__c = 20;
        mailObj.Length__c = 30;
        
        mailObj.Address__c = '2598 Summer Wind Dr';
        custAddr.Name = mailObj.Id;
        
        insert mailObj;
    }
    
    @isTest
    private static void genMailListTest(){
        MailDisplayController mailDisConTest = new MailDisplayController();
        
        mailDisConTest.genMailList();
        list<Mail__c> mailObjList = [SELECT Delivery_Status__c FROM Mail__c];
        
        System.assertEquals(1, mailObjList.Size());
        System.debug(mailObjList.Size());
    }
}