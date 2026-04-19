@isTest
public class AccountTriggerHandler_TestSetup {
    
    @testSetup
    private static void one(){
        List<Account> accList = New List<Account>();
        for(Integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Test '+i;
            acc.Active__c = 'Yes';
            acc.Industry = 'Media';
            accList.add(acc);
        }
        for(Integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Test '+i;
            acc.Active__c = 'Yes';
            acc.Industry = 'Education';             
            accList.add(acc);
        }
        Test.StartTest();
        insert accList;
        Test.StopTest();
        
    }
    @isTest
    private static void three(){
        List<Account> accList = New List<Account>();
        for(Integer i=1; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'HJ '+i;
            acc.CopyBillingToShipping__c = True;
            acc.BillingCity = 'Jaipur';
            accList.add(acc);
        }
        insert accList;
        List<Account> updatedAcc = [SELECT Id,BillingCity,ShippingCity FROM Account];
        for(Integer i=0; i<10; i++){
            system.assertEquals('Jaipur', updatedAcc[i].ShippingCity,'Shipping city not updated');
        }       
    }
    @isTest
    private static void twelve(){
        List<Account> accList = New List<Account>();
        for(Integer i=1; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'Do'+i;
            acc.Industry = 'Education';
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc:accList){
            acc.Industry = 'Media';
        }
        update accList;
        List<Account> updatedAccount = [SELECT Id, Rating FROM Account];
        for(Integer i=0; i<10; i++){
            system.assertEquals('Hot',updatedAccount[i].Rating, 'Rating is not updated');
        }
    }
    @isTest
    private static void eleven(){
        List<Account> accList = New List<Account>();
        for(Integer i=1; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'Mkl'+i;
            acc.CopyBillingToShipping__c = True;
            acc.BillingCity = 'Delhi';
            accList.add(acc);
        }
        insert accList;
        //return accList;
        
        List<Account> updateAccount = [SELECT ShippingCity FROM Account];
        for(Integer i=0; i<10; i++){
            system.assertEquals('Delhi', updateAccount[i].ShippingCity, 'Shipping city is not updated');
        }
    }
    @isTest   
    private static void ele(){
        List<Account> accList  = New List<Account>();
        
        for(Integer i=0; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'sl'+i;
            acc.CopyBillingToShipping__c = False;
            acc.BillingCity = 'Jai';
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc1:accList){
            acc1.CopyBillingToShipping__c = True;
            acc1.BillingCity = 'Udaipur';
        }
        update accList;
        
        List<Account> updateAccount = [SELECT Id, ShippingCity FROM Account];
        for(Integer i=0;  i<updateAccount.size(); i++){
            system.assertEquals('Udaipur', updateAccount[i].ShippingCity, 'Shipping city is not updated');
        }
    }
    @isTest
    private static void fourt(){
        List<Account> accList = New List<Account>();
        List<Contact> conList = New List<Contact>();
        
        for(Integer i=0; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'MNOP'+i;
            acc.Phone = '765432234';
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc:accList){
            Contact con = New Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
        }
        insert conList;
        
        for(Account acc1:accList){
            acc1.Phone = '958';
        }
        update accList;
        List<Account> updatedAccountwithcontact = [SELECT Id,(SELECT HomePhone FROM Contacts)FROM Account];
        for(Account acc:updatedAccountwithcontact){
            for(Contact con:acc.Contacts){
                system.assertEquals('958', con.HomePhone, 'Contact is not updated');
            }
        }
    }
}