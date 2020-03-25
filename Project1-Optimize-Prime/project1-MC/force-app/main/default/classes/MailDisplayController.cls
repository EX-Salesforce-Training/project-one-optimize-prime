/*
*   Name:       Matt Carey
*   Date:       03/23/2020
*   Update:     03/23/2020
*   Purpose:    Custom controller for accessing the custom Mail object in
                Salesforce to display on Visualforce page. Should display
                past deliveries as well as current deliveries based on delivery status
                with the name, number of packages, height, width, length, whether it's fragile,
                and if it has insurance from the Mail object.
*/
public with sharing class MailDisplayController {
    /*
    *   Create two variables that have their own getter and setter methods
    *   The first should be a Order variable for holding a value for the database
    *   The second variable should be of type list and hold a list of Order objects */
    public Mail__c mailVal {get;set;}
    public List<Mail__c> mailList {get;set;}

    //Create a public constructor that will set the orderVal variable to a default value.
    public MailDisplayController() {
        mailVal = New Mail__c(Delivery_Status__c = 'Processing');
    }

    
    //Create a method that will generate a list of Orders. Returning nothing and taking no parameters.
    public void genMailList(){
         //Assign the orderList variable to hold a SOQL statement that will hold ingormation to display
        mailList = [SELECT name, number_of_packages__c, height__c, width__c,
        length__c, fragile__c, insurance__c FROM Mail__c WHERE Delivery_Status__c = :mailVal.Delivery_Status__c];
        System.debug(mailList);
    }
}