public class Calculator {
    public Static Integer add(Integer a,Integer b){
        Integer c=a+b;
        return c;
    }
    public static Integer sub(Integer a,Integer b){
        Integer c=a-b;
        System.debug('Subtration is: '+c);
        return c;
    }
    public static Integer multi(Integer a,Integer b){
        Integer c=a*b;
        System.debug('Multiply is: '+c);
        return c;
    }
    public static Decimal divide(Integer a,Integer b){
        Decimal c=a/b;
        System.debug('Dividetion is: '+c);
        return c;
    }
}