public class Soqldemo {
    public static void soql(){
        List<Contact> conList = New List<Contact>();
        conList = [SELECT Id, Name, Email FROM Contact WHERE LastName IN('Jain','Jangir')];
        system.debug(ConList);
    }
}