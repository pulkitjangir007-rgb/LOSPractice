public class AreaAndPerimeterTriangle {
    public void area(){
        Integer l = 5;
        Integer b = 20;
        Decimal area = 0.50*(l*b);
        system.debug(area);
    }
    public Integer perimeter(Integer a, Integer b, Integer c){
        Integer per = a+b+c;
        system.debug(per);
        return per;
    }
    public static Decimal area1(Integer l, Integer b){
        Decimal area1 = 0.50*(l*b);
        system.debug(area1);
        return area1;
    }
    public static Integer Perimeter1(Integer l, Integer b, Integer  h){
       Integer Perimeter1 = l+b+h;
        system.debug(Perimeter1);
        return Perimeter1;
    }  
}