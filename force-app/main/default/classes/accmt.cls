@RestResource(urlMapping='/acm/')
global class accmt {
    @httpGet
    global static List<Account> getAccountsApex(){
        Map<String, String> accParamMap = RestContext.request.params;
        
        String accIndustry = accParamMap.get('Industry');
        
        List<Account> accList = [SELECT Id, Industry, Name, AnnualRevenue FROM Account WHERE AnnualRevenue!=null and Industry =: accIndustry];
        
        return accList;
    }
}