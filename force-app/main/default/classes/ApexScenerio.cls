public class ApexScenerio {
    public static void Q1(){
        List<Account> accList = New List<Account>();
        set<id> accId = New Set<Id>();
        
        accList = [SELECT Id,Name FROM Account LIMIT 5];
        for(Account acc:accList){
            accId.add(acc.id);
        }
        if(!accId.isEmpty()){
            for(Id id:accId){
                system.debug(id);
            }
        }
    }
    public static void Q2(){
        List<Account> accList = New List<Account>();
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        for(Account acc:accList){
            accMap.put(acc.Id,acc);
        }
        if(!accMap.isEmpty()){
            for(Account acc:accMap.values()){
                system.debug('Account Id = '+ acc.id);
                system.debug('Account Name = '+ acc.Name);
            }
        }
    }
    public static void Q3(){
        List<Account> accList = New List<Account>();
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        accList = [SELECT Id, Name FROM Account LIMIT 5];
        for(Account acc:accList){
            accMap.put(acc.Id,acc);
        }
        if(!accMap.isEmpty()){
            system.debug(accMap.values());
        }
    }
    public static void Q4(){
        List<Account> accList = New List<Account>();
        Set<Id> accId = New Set<Id>();
        Map<Id,Account> accMap = New Map<Id,Account>();
        
        accList = [SELECT Id,Name FROM Account LIMIT 5];
        
        for(Account acc:accList){
            accId.add(acc.Id);
            accMap.put(acc.Id,acc);
        }
        if(!accId.IsEmpty()){
            for(Id id:accId){
                if(accMap.containsKey(id)){
                    system.debug(accMap.get(id));
                }
            }
        }
    }
    public static void Q5(){
        List<Account> accList = New List<Account>();
        accList = [SELECT Id, Name, CreatedDate FROM Account WHERE CreatedDate = LAST_WEEK LIMIT 5];
        for(Account acc:accList){
            system.debug(acc);
        }
    }
    public static void Q6(){
        List<Contact> conList = New List<Contact>();
        conList = [SELECT id, LastName, CreatedDate FROM Contact WHERE CreatedDate = LAST_WEEK];
        
        if(!conList.IsEmpty()){
            for(Contact con:conList){
                system.debug(con); 
            }
        }
    }
    public static void Q7(){
        List<Account> accList = New List<Account>();
        accList = [SELECT Id,Name,(SELECT Id, LastName FROM Contacts) FROM Account];
        for(Account acc:accList){
            for(Contact con:acc.Contacts){
                system.debug(Con);
            }
        }
    }
    public static void Q8(){
        List<Contact> conList = New List<Contact>();
        conList = [SELECT Id, LastName,CreatedDate, Account.Phone, Account.Name FROM Contact WHERE CreatedDate = LAST_WEEK];
        for(Contact con:conList){
            system.debug(con);
            
        }
    }
    public static void Q9(){
        List<Account> accList = [SELECT Id,Name,Phone,(SELECT Id,Name, CloseDate, StageName FROM Opportunities)FROM Account WHERE Phone!=Null ORDER BY CreatedDate ASC];
        For(Account acc:accList){
            system.debug(acc);
        }
    }
    public static void Q10(){
        List<Account> accList = [SELECT Id, Name,(SELECT Id, LastName FROM Contacts) FROM Account WHERE Phone!=Null];
        for(Account acc:accList){
            system.debug(acc.Name +' Has '+ acc.Contacts.size()+ ' related Contacts');
        }
    }
    public static void Q11(){
        
        for(Account acc:[SELECT Id, Name,(SELECT Id, Name, Amount FROM Opportunities)FROM Account WHERE Phone!=NUll]){
            Decimal Amount = 0;
            for(Opportunity opp:acc.Opportunities){
                if(opp.Amount!=Null){
                    Amount = Amount + opp.Amount;
                }               
            } 
            system.debug(acc.Name+' has '+ Amount + ' Worth Opportunities');
        }
    }
    public static void Q12(){
        List<Account> accList = New List<Account>();
        for(Integer i=1; i<=2; i++){
            Account acc = New Account();
            acc.Name = 'POP '+i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        insert accList;
    }
    public static void Q13(){
        List<Account> accList = New List<Account>();  
        for(Integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Rol '+i;
            acc.Active__c = 'Yes';
            acc.Phone = '123456';
            accList.add(acc);
        }
        insert accList;
    }
    public static void Q14(){
        List<Opportunity> oppList = New List <Opportunity>();
        for(Integer i=1; i<=5; i++){
            Opportunity opp = New Opportunity();
            opp.Name = 'oop '+i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            oppList.add(opp);
        }
        insert oppList;
    }
    public static void Q15(){
        Account acc = New Account();
        acc.Name = 'Jkl';
        acc.Active__c = 'Yes';
        insert acc;
        
        contact con = New Contact();
        con.LastName = acc.Name;
        con.AccountId = acc.id;
        insert con;
    }
    public static void Q16(){
        try{ Account acc = New Account();
            acc.Name = 'KK';
            acc.Active__c = 'Yes';
            insert acc;
            
            Contact con = New Contact();
            con.Lastname = acc.Name;
            con.AccountId = acc.id;
            insert con;
            
            Opportunity opp = New Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.AccountId = acc.id;
            insert opp;
           } catch (Exception e) {
               System.debug('Error: ' + e.getMessage());
           }
    }
    public static void Q17() {
        List<Account> accList = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        
        for (Integer i = 1; i <= 5; i++) {
            Account acc = new Account();
            acc.Name = 'MM ' + i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        
        
        List<Database.SaveResult> accResults = Database.insert(accList, false);
        
        
        for (Database.SaveResult sr : accResults) {
            if (sr.isSuccess()) {
                System.debug('Inserted Account Id: ' + sr.getId());
            } else {
                System.debug('Error inserting Account: ' + sr.getErrors()[0].getMessage());
            }
        }
        
        for (Account acc : accList) {
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + ' Opportunity';
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        
        
        List<Database.SaveResult> oppResults = Database.insert(oppList, false);
        
        for (Database.SaveResult sr : oppResults) {
            if (sr.isSuccess()) {
                System.debug('Inserted Opportunity Id: ' + sr.getId());
            } else {
                System.debug('Error inserting Opportunity: ' + sr.getErrors()[0].getMessage());
            }
        }
    }
    public static void eighteen(){
        List<Account> accList = New List <Account>();
        List<Contact> conList = New List<Contact>();
        List<Opportunity> oppList = New List<Opportunity>();
        
        for(Integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'NI '+i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        insert accList;
        for(Account acc:accList){
            Contact con = New Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.id;
            conList.add(con);
            
            Opportunity opp = New Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.AccountId = acc.Id;
            oppList.add(opp);            
        }
        insert conList;
        insert oppList;
    }
    public static void nineteen(){
        List<Account> accList = New List<Account>();
        accList = [SELECT Id, Phone FROM Account WHERE Phone = Null];
        for(Account acc:accList){
            acc.Phone = '654321';
        }
        update accList;
    }
    public static void Twenty(){
        List<Contact> conList = New List<Contact>();
        conList = [SELECT Id, Email FROM Contact WHERE Email=Null];
        for(Contact Con:conList){
            con.Email = 'test@test.com';
        }
        update conList;
    }
    public static void twentyOne(){
        /* List<Account> accList = New List<Account>();


accList = [SELECT Id,Phone FROM Account WHERE Phone=Null];
for(Account acc:accList){
acc.Phone = '123456';
}

for(Integer i=1; i<=5; i++){
Account acc = New Account();
acc.Name = 'New '+i;
acc.Phone = '123456';
acc.Active__c = 'Yes';
accList.add(acc);
}
if(!accList.isEmpty()){
upsert accList;
}*/
        
        
        List<Account> accList= [SELECT Id,Phone FROM Account WHERE Phone=Null];
        for(Account acc:accList){
            acc.Phone = '123456';
        }
        for(Integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'NO '+i;
            acc.Phone = '123456';
            acc.Active__c = 'yes';
            accList.add(acc);
            
            Database.upsertresult[] srList = Database.upsert(accList,false);
            for(Database.upsertresult sr:srList){
                if(sr.isSuccess()){
                    system.debug(sr.getId());
                }else
                    for(Database.Error err:sr.getErrors()){
                        system.debug(err.getMessage());
                    }
            }
        }
    }
    public static void twentyTwo(){
        List<Opportunity> oppList = New List<Opportunity>();
        oppList = [SELECT Id,StageName FROM Opportunity WHERE CreatedDate = LAST_MONTH];
        for(opportunity opp:oppList){
            opp.stageName = 'Closed Won';
        }
        for(Integer i=1; i<=5; i++){
            Opportunity opp = New Opportunity();
            opp.Name = 'MMO '+i;
            opp.stageName = 'Prsopecting';
            opp.CloseDate = system.today();
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            upsert oppList;
        }
    }
    public static void twentyThree(){
        List<Account> accList = New List<Account>();
        accList = [SELECT Id, Phone FROM Account WHERE Phone='123456'];
        /*if(!accList.isEmpty()){
delete accList;
}*/
        Database.deleteresult[] dllist = Database.Delete(accList,False);
        for(Database.deleteresult dl:dlList){
            if(dl.issuccess()){
                system.debug(dl.getId());
            } else{
                for(Database.Error er:dl.getErrors()){
                    system.debug(er.getMessage());
                }
            }
        }
    }
    public static void twentyFour(){
        List<Account> accList = New List<Account>();
        accList = [SELECT Id, Phone FROM Account WHERE Phone='123456' ALL ROWS];
        if(!accList.isEmpty()){
            undelete accList;
        }
        
    }
    public static void twentyFive(){
        List<Opportunity> oppList = New List<Opportunity>();
        oppList = [SELECT Id,Name, CloseDate,StageName FROM Opportunity WHERE createdDate = LAST_MONTH AND StageName='Closed Lost'];
        if(!oppList.isEmpty()){
            delete oppList;
        }
    }
    public static void twentySix(){
        List<Account> accList = [SELECT Id,Name FROM Account WHERE CreatedDate=LAST_WEEK];
        List<Opportunity> oppList = New List<Opportunity>();
        for(Account acc:accList){
            Opportunity opp = New Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.AccountId = acc.id;
            oppList.add(opp);
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
    public static void twentySeven(){
        List<Account> accList =  New List<Account>();
        accList = [SELECT Id, Name, Phone FROM Account WHERE CreatedDate >= LAST_N_DAYS:7];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Phone = '1234567890';
            }
            Database.saveresult[] srList = Database.update(accList,false);
            for(Database.saveresult sr: srList){
                if(sr.isSuccess()){
                    system.debug(sr.getId());
                }else
                    system.debug(sr.getErrors()[0].getMessage());
            }
        }
    }
    public static void twentyEight(){
        List<Opportunity> oppList = [SELECT Id,Name, StageName FROM Opportunity WHERE CreatedDate = LAST_N_DAYS:7 LIMIT 50];
        for(Opportunity opp:oppList){
            if(opp.stageName == 'Closed Won'){
                opp.Description = 'Opportunity is Closed Won';
            }else if(opp.StageName == 'Closed Lost'){
                opp.Description = 'Opportunity is Closed Lost';
            }
            if(!oppList.isEmpty()){
                update oppList;  
            }
        }
    }

    public static void thirty(){
        List<Contact> conList = [SELECT Id,Account.Phone,Phone FROM Contact WHERE CReatedDate = LAST_MONTH];
        for(Contact con:conList){
            if(con.Phone == Null){
                con.Phone = con.Account.Phone;
            }
        }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    public static void thirtyOne(){
        List<Account> accList = [SELECT Id, Name,Total_Salary__c,(SELECT Id, Salary__c FROM Employees__r)FROM Account WHERE CreatedDate=LAST_MONTH];
        Decimal Salary = 0;
        
        for(Account acc:accList){
            for(Employee__c emp: acc.Employees__r){
                Salary = Salary + emp.Salary__c;           
            }
            acc.Total_Salary__c = Salary;
        }
        if(!accList.isEmpty()){
            update accList;   
        }
    }
    public static void thirtyTwo(){
        List<Employee__c> empList = [SELECT Id,Phone__c,Account__r.Phone FROM Employee__c WHERE CreatedDate = THIS_YEAR];
        for(Employee__c emp:empList){
            if(emp.Phone__c==Null){
                emp.Phone__c = emp.Account__r.Phone;
            }
        }
        if(!empList.isEmpty()){
        update empList;
        }
    }
}