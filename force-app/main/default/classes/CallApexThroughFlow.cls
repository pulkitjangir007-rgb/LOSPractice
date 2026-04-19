public class CallApexThroughFlow {
    @InvocableMethod
    public static List<Decimal> AnnualRev(List<Id> Ids){
        List<Decimal> updatedAnnualRevenue = New List<Decimal>();
        
        List<Opportunity> oppList = [SELECT AccountId,Amount FROM Opportunity WHERE Id =:Ids[0]];
        List<Account> acList = [SELECT Id,AnnualRevenue FROM Account WHERE Id =: oppList[0].AccountId];

        acList[0].AnnualRevenue = acList[0].AnnualRevenue +  oppList[0].Amount;
        update acList;
        updatedAnnualRevenue.add(acList[0].AnnualRevenue);
        return updatedAnnualRevenue;
    }
}