public class Sobjectdatatype {
    public static List<Account> createbulkAccount(){
        List<Account>accList = New List<Account>();
        //Account is an sobject
        //here it is working as datatype
        for(Integer i=0; i<=200; i++){
            Account acc = New Account();
            acc.Name = 'LOK'+i;
            acc.Phone = '123456';
            acc.Active__c = 'Yes';
            acc.AnnualRevenue = 10000000;
            accList.add(acc);         
        }
        insert accList;
        return accList;
    }
    
    public static void CreatbulkOpp(){
         List <Opportunity> oppList = New List<Opportunity>();
        List<Account> accList = createbulkAccount();
        
        for(Integer i=0; i<200; i++){
            Opportunity opp = New Opportunity();           
            opp.Name = 'SPD'+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.AccountId = accList[i].Id;
            oppList.add(opp);     
        }
        insert oppList;
    }
}