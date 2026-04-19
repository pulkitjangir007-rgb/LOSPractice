public class WeeklyGovernanceLimitService {

    public static void executeWeeklyProcess() {

        // =========================
        // STORAGE
        // =========================
        Map<String, System.OrgLimit> limits = System.OrgLimits.getMap();

        Decimal dataUsed  = limits.get('DataStorageMB').getValue();
        Decimal dataTotal = limits.get('DataStorageMB').getLimit();
        Decimal fileUsed  = limits.get('FileStorageMB').getValue();
        Decimal fileTotal = limits.get('FileStorageMB').getLimit();

        // =========================
        // API (Integration User Context)
        // =========================
        Integer apiUsed  = 0;
        Integer apiTotal = 0;

        try {
            Map<String, Object> apiLimits = getApiLimits();
            Map<String, Object> dailyApi =
                (Map<String, Object>) apiLimits.get('DailyApiRequests');

            Decimal maxVal = (Decimal) dailyApi.get('Max');
            Decimal remVal = (Decimal) dailyApi.get('Remaining');

            apiTotal = maxVal != null ? maxVal.intValue() : 0;
            apiUsed  = (maxVal != null && remVal != null)
                       ? maxVal.intValue() - remVal.intValue()
                       : 0;

        } catch (Exception e) {
            System.debug('API limits not available: ' + e.getMessage());
        }

        // =========================
        // PERCENTAGES
        // =========================
        Decimal dataPct = calcPct(dataUsed, dataTotal);
        Decimal filePct = calcPct(fileUsed, fileTotal);
        Decimal apiPct  = calcPct(apiUsed, apiTotal);

        // =========================
        // EMAIL
        // =========================
        sendEmail(dataUsed, dataTotal, dataPct,
                  fileUsed, fileTotal, filePct,
                  apiUsed, apiTotal, apiPct);
    }

    private static Map<String, Object> getApiLimits() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:SF_OAuth/services/data/v65.0/limits');
        req.setMethod('GET');

        HttpResponse res = new Http().send(req);
        return (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
    }

    private static Decimal calcPct(Decimal used, Decimal total) {
        return (total == null || total == 0) ? 0 : (used / total) * 100;
    }

    private static void sendEmail(
        Decimal dUsed, Decimal dTot, Decimal dPct,
        Decimal fUsed, Decimal fTot, Decimal fPct,
        Integer aUsed, Integer aTot, Decimal aPct
    ) {
        String body =
            'Weekly Salesforce Governance Report\n\n' +
            'DATA STORAGE: ' + dUsed + '/' + dTot + ' MB (' + dPct.setScale(2) + '%)\n' +
            'FILE STORAGE: ' + fUsed + '/' + fTot + ' MB (' + fPct.setScale(2) + '%)\n' +
            'API (Integration User): ' + aUsed + '/' + aTot + ' (' + aPct.setScale(2) + '%)\n';

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[]{'pulkitjangir1@gmail.com'});
        email.setSubject('Weekly Salesforce Limits Report');
        email.setPlainTextBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
    }
}