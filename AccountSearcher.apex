public class AccountSearcher {
    String searchText;
    List<Account> results;
    public Boolean IsOwnerSpecific {get;set;}
    
    public String getSearchText() {
        return searchText;
    }
    public void setSearchText(String s) {
        searchText = s;
    }
    public List<Account> getResults() {
        return results;
    }
    public PageReference search() {
        if(IsOwnerSpecific){
            results = (List<Account>)[FIND :searchText RETURNING Account(Name, Industry, Rating /*,Account_Region__c, Account_Priority__c, Account_Summary__c*/ where ownerId=:UserInfo.getUserId()) ][0];
        }else{         
            results = (List<Account>)[FIND :searchText RETURNING Account(Name, Industry, Rating /*,Account_Region__c, Account_Priority__c, Account_Summary__c*/)][0];
        }
        return null;
    }
}