public class AccountWithContacts {
    @future
    public static void countcontacts(List<Id> accIds){
        List<Account> accList = [SELECT Id, Total_Contacts_A__c,BillingCity,Industry,Phone,CopyBillingToShipping__c,(SELECT Id FROM Contacts)FROM Account WHERE Id IN:accIds];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Total_Contacts_A__c = acc.Contacts.size();
                acc.CopyBillingToShipping__c = True;
                acc.Phone = '788';
                acc.BillingCity = 'Jaipur';
                acc.Industry = 'Media';
            }
            update accList;
        }
    }
}