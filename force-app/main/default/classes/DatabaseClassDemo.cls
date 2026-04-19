public class DatabaseClassDemo {
    public static void demo(){
        List<Account> accList = new List<Account>{
            new Account(Name='Yol 1'),
                new Account(Name = 'Yol 2'),
                new Account(Name = 'Yole 3'),
                new Account()
                };
                    
                    List<Database.SaveResult> srList = Database.insert(accList,false);
        for(Database.SaveResult sr: srList){
            if(sr.isSuccess()){
                system.debug('Account Id: ' +sr.getId());
            }else {
                system.debug(sr.getErrors());
            }
        }
    }
}