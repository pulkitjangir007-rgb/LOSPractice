public class MapDemo {
    public static void demo(){
        Map<Integer, String> intToStrMap = new Map<Integer, String>();
        
        intToStrMap.put(1,'Red');
        intToStrMap.put(23,'Green');
        intToStrMap.put(13,'Blue');
        intToStrMap.put(40,'Green');
        
        system.debug('Map contains.....'+intToStrMap);
        system.debug('Map contains.....'+intToStrMap.keyset());
        system.debug('Map contains.....'+intToStrMap.values());
        system.debug('Map contains.....'+intToStrMap.Size());
        
        intToStrMap.put(40,'White');       
        system.debug('Map contains.....'+intToStrMap);
        
        intToStrMap.remove(13);       
        system.debug('Map contains.....'+intToStrMap);
        
        if(intToStrMap.containsKey(13)){
            system.debug('Available');
        }else{
            system.debug('Not Available');
        }
        
        system.debug('Map value = ' + intToStrMap.get(40));
    }
    public static void listToMap(){
        List<Account> accList = new List<Account>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        accList = [SELECT Id, Name, Phone FROM Account LIMIT 10];
        accMap.putAll(accList);
        
        system.debug('List Contains...' + accList);
        system.debug('Map Contains...' + accMap);
        
        
    }
}