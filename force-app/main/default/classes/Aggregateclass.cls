public class Aggregateclass {
    public static void Ag(){
        List<AggregateResult> groupedResults = [SELECT AccountId, Sum(Amount) FROM opportunity GROUP BY AccountId];
        system.debug(groupedResults);
        for(AggregateResult ar:groupedResults){
            system.debug('Account ID ='+ ar.get('AccountId'));
            system.debug('Sum of Amount=' + ar.get('expr0'));
        }
    }
}