public class ApexDemo {
    public static void Q1(){
        List<Account> accList = New List<Account>();
        accList = [SELECT Id, Name, Phone FROM Account LIMIT 10];
        for(Account acc:accList){
            system.debug(acc);
        }
    }
    
    public static void Q2(){
        List<Account> accList = New List<Account>();
        Set<Id> accId = New Set<Id>();
        
        accList = [SELECT Id, Name, Phone FROM Account LIMIT 10];
        if(!accList.isEmpty()){
        for(Account acc:accList){
            accId.add(acc.Id);
        }
        }
        system.debug(accId);
    }
    
    public static void Q3(){
        List<Account> accList = New List<Account>();
        Set<Id> accId = New Set<Id>();
        accList = [SELECT Id, Name, Phone FROM Account LIMIT 10];
        
        for(Account acc:accList){
            accId.add(acc.Id);
        }
        if(!accId.isEmpty()){
            for(Id i: accId){
                system.debug(i);
            }       
        }
    }
    
    public static void Q4(){
        List<Account>accList = New List<Account>();
        accList = [SELECT Id, Name, Phone FROM Account LIMIT 10];
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        for(Account acc:accList){
            accMap.put(acc.Id, acc);
        }
        system.debug(accMap);
        
        if(!accMap.isEmpty()){
            for(Id i: accMap.keyset()){
                system.debug(i);
            }
        }
        if(!accMap.isEmpty()){
            for(Account acc: accMap.values()){
                system.debug(acc);
            }
            
        }
    }
}