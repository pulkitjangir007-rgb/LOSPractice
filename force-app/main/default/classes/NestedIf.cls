public class NestedIf {
    public static void Ifn(Integer Num){
        if(Num>=0){
            if(Num==0){
                system.debug('Number is Zero');
            }
            else{
                system.debug('Number is Positive');
            }
        }else{
            system.debug('Number is Negative');
        }
    }
}