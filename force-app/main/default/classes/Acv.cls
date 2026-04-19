@RestResource(urlMapping='/acvr/')
global class Acv{
    @httpPost
    global static String createAccount(String accName, String accRating,String accIndustry){
        Account acc = new Account();
        acc.Name = accName;
        acc.Rating = accRating;
        acc.Industry = accIndustry;
        try{
            insert acc;
            return 'Account created successfully';
        }
        catch(Exception ex){
            return ex.getMessage();
        }  
    }
}