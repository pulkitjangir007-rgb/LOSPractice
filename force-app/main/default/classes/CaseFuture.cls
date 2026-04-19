public class CaseFuture {
//@future
    public static void lkl(set<Id> csId){
        List<Case> csList = [SELECT Id FROM Case WHERE Id IN:csId];
        delete csList;
    }
}