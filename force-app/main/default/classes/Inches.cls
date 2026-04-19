public class Inches {
    public static void Inc(Integer Inch){
        if(Inch >= 12){
            Decimal feet = Inch * 0.083;
             Integer rem = Math.mod(Inch, 12);   
            System.debug('Feet is '+ feet + 'Remaining Inches is+ '+rem);
        }else{
            system.debug('Inches is not greater than 12');
        }
    }
}