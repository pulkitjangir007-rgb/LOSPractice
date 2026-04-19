public class DiscountCalculator {
    public static Decimal getDiscountPercentage(Decimal opportunityAmount){
        List<Discount_Tiers__c> dtList = [SELECT Minimum_Amount__c, Discount_Percentage__c, Customer_Tier__c FROM Discount_Tiers__c ORDER BY Minimum_Amount__c ASC];
        Decimal discountpercentage = 0;
        for(Discount_Tiers__c tier:dtList){
            if(opportunityAmount >= tier.Minimum_Amount__c){
                discountPercentage = tier.Discount_Percentage__c;
            } else {
                break;               
            }
        }
        return discountPercentage;
    }
    
    public static void applyDiscounttoOpp(Opportunity opp){
        Decimal discountPercentage = getDiscountPercentage(opp.Amount);
        Decimal discountAmount = opp.Amount*(discountPercentage/100);
        opp.Discount__c = discountAmount;
        opp.Discount_Percentage__c = discountPercentage;
    }
}