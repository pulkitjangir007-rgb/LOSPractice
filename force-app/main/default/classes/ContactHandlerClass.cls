public class ContactHandlerClass {
    public static void Q5(List<Contact> conList){
        List<Account> accList = New List<Account>();
        //set<Id> accId = New Set<Id>();
        
        for(Contact con:conList){
            if(con.AccountId == Null){
                Account acc = New Account();
                acc.Name = con.LastName;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            insert accList;
        }
        Integer i=0;
        for(Contact con:conList){
            con.AccountId = accList[i].Id;
            i++;
        }
    }
    public static void Q33(List<Contact> newList){
        
        List<Messaging.Email> emailmsg = New List<Messaging.Email>();
        
        for(Contact con:newList){
            if(con.Email!=Null){
                
                Messaging.SingleEmailMessage ems = New Messaging.SingleEmailMessage();
                String[] Address = New String[]{con.Email};
                ems.SetToAddresses(Address);
                String Subject = 'Welcome Salesforce';
                ems.SetSubject(Subject);
                String displayName = 'Pulkit Jangir';
                ems.SetSenderDisplayName(displayName);
                String Body = 'Hi This Is Email';
                ems.setHtmlBody(Body);
                emailmsg.add(ems);
            }
        }
        Messaging.sendEmail(emailmsg);
    }
}