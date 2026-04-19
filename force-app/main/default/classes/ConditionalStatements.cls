public class ConditionalStatements {
    public static Integer findMax(Integer num1, Integer num2){
        if(num1>num2){
            system.debug('num1 is maximum as compared to num2');
            return num1;
        }else{
            system.debug('num2 is maximum as compared to num1');
              return num2;
        }
    }
}