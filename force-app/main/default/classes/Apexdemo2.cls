public class Apexdemo2 {
    public static void Q1(){
        List<Account> accList = New List<Account>();
        List<Opportunity> oppList = New List<opportunity>();
        Set<Id> accId = New Set<Id>();
        Set<Id> oppId = New Set<Id>();
        Map<Id,opportunity> oppMap = New Map<id,opportunity>();
        
        for(Integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'lo'+i;
            acc.Active__c = 'Yes';
            acc.Rating = 'Hot';
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc:accList){
            Opportunity opp = New opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today()+7;
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        insert oppList;
        if(!accList.isEmpty()){
            for(Account acc:accList){
                accId.add(acc.Id);
            }
        }
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                oppId.add(opp.Id); 
                oppMap.put(opp.id,opp);
            }
        }
        
        system.debug(accId);
        system.debug(oppId);
        system.debug(oppMap);
        
        if(!oppMap.isEmpty()){
            for(Id i:oppMap.keyset()){
                system.debug(i);
            }
            
            for(Opportunity opp: oppMap.values()){
                system.debug(opp);
            }
        }
    }
}