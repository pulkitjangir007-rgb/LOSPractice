public class NASA_API_Example {
    public static void getAstronomyPictureOfTheDay() {
        String apiEndpoint = 'https://api.nasa.gov/planetary/apod';
        String apiKey = 'SGeJPn3YV7RMI8UEXiZSxt7ZYs2yKRcoZPfN9wIk';   //Paste the API Key you get in Email
        String requestUrl = apiEndpoint + '?api_key=' + apiKey;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(requestUrl);
        req.setMethod('GET');
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            String jsonResponse = res.getBody();
            String jsonResponseFinal = jsonResponse.replaceAll('"date":', '"dateparam":');
            System.debug('JSON Response = ' + jsonResponseFinal);
            
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(jsonResponseFinal);
            System.debug('Map Response = ' + responseMap);
            
            String url = (String) responseMap.get('url');
            String title = (String) responseMap.get('title');
            String explanation = (String) responseMap.get('explanation');
            String hdUrl = (String) responseMap.get('hdurl');
            String dateparam = (String) responseMap.get('dateparam');
            String copyright = (String) responseMap.get('copyright');
            
            Nasa__c ns = New Nasa__c();
            ns.Name = Title;
            ns.url__c = url;
            ns.Title__c = title;
            ns.Explaination__c  = explanation;
            ns.hdUrl__c = hdUrl;
            ns.dateparam__c = dateparam;
            ns.copyright__c = copyright;
            insert ns;
            
            
            
            System.debug('Astronomy Picture URL: ' + url);
            System.debug('Title: ' + title);
            System.debug('Explanation: ' + explanation);
            System.debug('HD URL: ' + hdUrl);
            System.debug('Date: ' + dateparam);
            System.debug('Copyright: ' + copyright);
        }
    }
}