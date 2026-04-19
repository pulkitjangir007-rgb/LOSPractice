public class RectangleWithStaticMethods {
    public static Integer area(Integer length, Integer breadth){
        Integer a;
        a= Length * breadth;
        system.debug('Area = '+a);
        return a;
    }
    public static Integer perimeter(Integer length, Integer breadth){
        Integer p;
        p = 2*(Length + breadth);
        system.debug('Perimeter = '+ p);
        return p;
    }
}