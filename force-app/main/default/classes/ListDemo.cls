public class ListDemo {
    public static void stringList(){
        List<String> strList = New List<String>();
        List<String> strList2 = New List<String>();
        strList.add('Red');
        strList.add('Blue');
        strList.add('Green');
        strList.add('yellow');
        strList2.add('Black');
        strList2.add('neon');
        
        system.debug('List Contains...'+ strList);
        
        strList.set(1,'orange');
        system.debug(strList);
        
        strList.addAll(strList2);
        system.debug(strList);
        
        strList2 = strList.Clone();
        system.debug(strList2);
        
         strList2.Clear();
        system.debug(strList2);
        
        strList.remove(3);
        system.debug(strList);
        
        strList.sort();
        system.debug(strList);
        
    }
    public static void integerList(){
        List<Integer> intList = new List<Integer>();
        intList.add(10);
        intList.add(40);
        intList.add(20);
        intList.add(40);
        system.debug('List Contains...'+ intList);
    }
}