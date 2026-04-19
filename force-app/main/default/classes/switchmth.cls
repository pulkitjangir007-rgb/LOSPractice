public class switchmth {
    public static void sw(Integer num){
        switch on num{
            when 1{
                system.debug(Calculator.add(4,5));
            }
            when 2{
                system.debug(AreaAndPerimeterTriangle.area1(20,10));
            }
            when 3{
                system.debug(AreaAndPerimeterTriangle.Perimeter1(20,10,30));
            }
            when 4{
                system.debug(RectangleWithStaticMethods.per(10,30));
            }
            when else{
                system.debug('Please enter a number between 1-4');
            }
        }
    }
}