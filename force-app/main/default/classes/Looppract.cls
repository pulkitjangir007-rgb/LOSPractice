public class Looppract {
    //Natural Numbers
    public static void pl(){
        for(Integer i=1; i<=10; i++){
            system.debug(i);
        }
    }
    //Table Print
    public static void table(Integer num){
        for(Integer i=1; i<=10; i++){
            system.debug(num +'x'+ i + '='+ num*i);
        }
    }
    //Even numbers
    public static void even(Integer n){
        for(Integer i=1; i<=n; i++){
            IF(math.mod(i,2)==0){
                System.debug(i);
            }
        }
    }
    //Odd Numbers
    public static void odd(Integer n){
        for(Integer i=1; i<=n; i++){
            IF(math.mod(i,2)!=0){
                System.debug(i);
            }
        }
    }
    // Natural Numbers in reverse order
    public static void NR(Integer n){       
        for(Integer i=n; i>=1; i--){
            system.debug(i);
        } 
    }
    // Sum of natural numbers 
    public static void son(Integer num){
        Integer Sum=0;
        for(   Integer i=1; i<=num; i++){
            sum= sum+i;       
        }
        system.debug(sum);
    }
    //sum of even numbers
    public static void eve(Integer num){
        Integer Sum=0;
        for(   Integer i=1; i<=num; i++){
            if(math.mod(i,2)==0){
                sum= sum+i; 
            }           
        }
        system.debug(sum);
    }
    ////sum of odd numbers
        public static void od(Integer num){
        Integer Sum=0;
        for(   Integer i=1; i<=num; i++){
            if(math.mod(i,2)!=0){
                sum= sum+i; 
            }           
        }
        system.debug(sum);
    }
}