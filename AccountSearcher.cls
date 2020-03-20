public class AccountSearcher {
    String searchText;
    List<Mail__c> results;
    public Boolean IsOwnerSpecific {get;set;}
    
    public String getSearchText() {
        return searchText;
    }
    public void setSearchText(String s) {
        searchText = s;
    }
    public List<Mail__c> getResults() {
        return results;
    }
    public PageReference search() {
        if(IsOwnerSpecific){
            results = (List<Mail__c>)[FIND :searchText RETURNING Mail__c(Address__c, Insured_Value__c, Recipient__c where ownerId=:UserInfo.getUserId()) ][0];
        }else{         
            results = (List<Mail__c>)[FIND :searchText RETURNING Mail__c(Address__c, Insured_Value__c, Recipient__c )][0];
        }
        return null;
    }
}