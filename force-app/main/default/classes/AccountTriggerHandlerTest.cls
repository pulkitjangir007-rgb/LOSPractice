@isTest
public class AccountTriggerHandlerTest{
    @isTest
    public static void Q1(){
        List<Account> accList= New List<Account>();
        
        for(Integer i=1; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'Test'+i;
            acc.Active__c = 'Yes';
            acc.Industry = 'Media';
            accList.add(acc);
        }
        Test.StartTest();
        insert accList;
        Test.StopTest();
        List<Account> updatedAccount = [SELECT Id, Rating FROM Account WHERE Id IN:accList];
        system.assertEquals('Hot', updatedAccount[0].Rating, 'Rating is not updated');
    }
    @isTest
    public static void Q3(){
        List<Account> accList = New List<Account>();
        for(Integer i=1; i<=10; i++){
            Account acc = New Account();
            acc.Name = 'lk'+i;
            acc.BillingCity = 'Jaipur';
            acc.BillingCountry = 'Afghanistan';
            acc.BillingPostalCode = '232';
            acc.CopyBillingToShipping__c = True;
            accList.add(acc);
        }
        Test.StartTest();
        insert accList;
        Test.StopTest();
        List<Account> accList1 = [SELECT Id, ShippingCity, ShippingCountry, ShippingPostalCode FROM Account WHERE Id IN:accList];
        system.assertEquals('Jaipur', accList1[0].ShippingCity, 'Shipping is not updated');
    }
    @isTest
    public static void Q5(){
        List<Account> accList = New List<Account>();
        List<Contact> conList = New List<Contact>();
        for(Integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Lk'+i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        Test.StartTest();
        insert accList;
        Test.StopTest();
        List<Contact> updatedaccwithcon = [SELECT Id, AccountId FROM Contact WHERE AccountId IN:accList];
        
        system.assertEquals(5, updatedaccwithcon.Size(), 'Contact is nor created');
        
    }
}