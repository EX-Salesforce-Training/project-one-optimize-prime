@isTest
public with sharing class MailDisplayControllerTest {
    @TestSetup
    private static void CreateMail(){
        Mail__c mailObj = new Mail__c();
        mailObj.Delivery_Status__c = 'Processing';
        
        insert mailObj;
    }
    
    @isTest
    private static void genMailListTest(){
        MailDisplayController mailDisConTest = new MailDisplayController();
        
        mailDisConTest.genMailList();
        list<Mail__c> mailObjList = [SELECT Delivery_Status__c FROM Mail__c];
        
        System.assertEquals(1, mailObjList.Size());
        System.assertEquals('Processing', mailObjList[0].Delivery_Status__c);
        System.assertEquals('Dev Kit', mailObjList[0].Name);
        System.assertEquals(1, mailObjList[0].Number_of_Packages__c);
        System.assertEquals(10, mailObjList[0].Height__c);
        System.assertEquals(20, mailObjList[0].Width__c);
        System.assertEquals(10, mailObjList[0].Length__c);
        System.assertEquals(true, mailObjList[0].Fragile__c);
        System.assertEquals(false, mailObjList[0].Insurance__c);
        System.assertEquals(1000, mailObjList[0].Package_Value__c);
        System.assertEquals('2598 Summer Dr Winter Park FL 32792', mailObjList[0].Address__c);
    }
}