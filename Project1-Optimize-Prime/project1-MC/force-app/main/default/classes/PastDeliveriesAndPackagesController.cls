/*
*   Name:       Matt Carey
*   Date:       03/22/2020
*   Update:     03/22/2020
*   Purpose:    Custom controller for accessing the Orders object in
                Salesforce to display on Visualforce page. Should display
                past deliveries as well as current deliveries based on status
                with the Order Number, Type, a Description, and the End Date
                of the Order.
*/
public class PastDeliveriesAndPackagesController {
    //Create two public variables.
    //The first one should be a public constructor that will have a getter and setter method.
    //The second variable will hold a list of Order objects and will have a getter and setter method.
    public Order orderVal {get;set;}
    public List<Order> orderList {get;set;}

    //Create a method that will display the Order objects as a method call.
    public PastDeliveriesAndPackagesController(){
        orderVal = new Order(Status = 'Draft');
    }

    //Create a public method that doesn't return anything
    //and takes no parameters
    public void genOrderList(){orderList = [select id, description, type, shippingaddress,
        ordernumber, enddate from Order where status = :orderVal.Status];}
}