/*
*   Name:       Matt Carey
*   Date:       03/22/2020
*   Update:     03/23/2020
*   Purpose:    Custom controller for accessing the Orders object in
                Salesforce to display on Visualforce page. Should display
                past deliveries as well as current deliveries based on status
                with the Order Number, Type, a Description, and the End Date
                of the Order.
*/
public class PastDeliveriesAndPackagesController {
    /*
    *   Create two variables that have their own getter and setter methods
    *   The first should be a Order variable for holding a value for the database
    *   The second variable should be of type list and hold a list of Order objects */
    public Mail__c mailVal {get;set;}
    public list<Mail__c> mailList {get;set;}

    //Create a public constructor that will set the orderVal variable to a default value.
    public PastDeliveriesAndPackagesController(){
        mailVal = New Mail__c(Delivery_Status__c = 'Processing');
    }

    //Create a method that will generate a list of Orders. Returning nothing and taking no parameters.
    public void genMailList(){
        //Assign the orderList variable to hold a SOQL statement that will hold ingormation to display
        mailList = [select id, name, number_of_packages__c,
        height__c, width__c, length__c, fragile__c, insurance__c
        from Mail__c where Delivery_Status__c = :mailVal.Delivery_Status__c];
    }
}