public class ExceptionHandling {
    public static void demo(Integer num1, Integer num2){
        system.debug('Before exception');
        try{
            Integer result = num1/num2;
            system.debug('Result = '+result);
        }
        catch(Exception e){
            system.debug(e.getMessage());
            
        }
        system.debug('after exception');
    }
    
    public static void demo2(String accName){
        system.debug('before exception');
        try{
            Account acc = New Account();
            acc.Name = accName;
            insert acc;
        }
        catch(Exception e){
            system.debug(e.getMessage());
        }
        system.debug('After execution');
    }
}