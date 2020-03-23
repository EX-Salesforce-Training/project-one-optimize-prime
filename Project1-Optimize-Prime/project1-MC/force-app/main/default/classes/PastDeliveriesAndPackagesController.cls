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
    public Order orderVal {get;set;}
    public list<Order> orderList {get;set;}

    //Create a public constructor that will set the orderVal variable to a default value.
    public PastDeliveriesAndPackagesController(){
        orderVal = New Order(Order_Status__c = 'Created');
    }

    //Create a method that will generate a list of Orders. Returning nothing and taking no parameters.
    public void genOrderList(){
        //Assign the orderList variable to hold a SOQL statement that will hold ingormation to display
        orderList = [select id, ordernumber, type, description, enddate from Order
        where Order_Status__c = :orderVal.Order_Status__c];
    }
}