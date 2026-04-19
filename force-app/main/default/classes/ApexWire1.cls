public with sharing class ApexWire1 {
@AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        return [SELECT Id, Name, Title,  Email, Phone FROM Contact WITH SECURITY_ENFORCED LIMIT 10];
    }
}