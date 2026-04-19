global class SoapWebServiceAccOpp {
    public class APIException extends Exception {}
    
    webservice static String getAPIStatus (String message) {
        return 'Ready your message is ' + message;
    }
    
    webservice static List<Account> getAccWithOppDetail (String searchValue) {
        if (searchValue != null) {
            List<Account> accList = [SELECT Id, Name, Rating, (SELECT Id, Name, Amount FROM Opportunities) FROM Account WHERE Rating = :searchValue];
            
            return accList;    
        }else {              
            throw new APIException('error');
        }
    }
}