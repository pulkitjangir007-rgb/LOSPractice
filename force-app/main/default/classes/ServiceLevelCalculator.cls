public class ServiceLevelCalculator {
    public static Integer getMaxResponseTime(String customerTier){
        
        Support_Service_Level__mdt serviceLevel = [SELECT Max_Response_Time__c FROM Support_Service_Level__mdt WHERE Customer_Tier__c =:customerTier LIMIT 1];
        return(serviceLevel!=Null)?Integer.valueOf(ServiceLevel.Max_Response_Time__c):72;
    }
    public static void setTargetResponseTime(Case caseRecord){
        String customerTier = caseRecord.Customer_Tier__c;
        
        Integer responseTimeInHours = getMaxResponseTime(CustomerTier);
        caseRecord.Target_Response_Time__c = responseTimeInHours;
    }
}