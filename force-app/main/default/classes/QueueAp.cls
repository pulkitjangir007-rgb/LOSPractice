public class QueueAp implements Queueable {
    private List<Account> accList;
    private Id parentAccId;
    
    //Constructor
    public QueueAp(List<Account> accRecords, Id accId){
        accList = accRecords;
        ParentAccId = accId;
    }
    public void execute(QueueableContext ct){
        for(Account acc:accList){
            acc.parentId = parentAccId;
        }
        update accList;
    }
}