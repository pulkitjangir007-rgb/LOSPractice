public class Rectangle {
Integer length;
    Integer breadth;
    
    //Deafult Constructor 
    public Rectangle(){
        length = 10;
        breadth = 20;
    }
    //Parameterized Constructor
    Public Rectangle(Integer l, Integer b){
        Length = l;
        breadth = b;
    }
    //Methods
    public void area(){
        Integer a;
        a= length * breadth;
        system.debug('Area: '+a);
    }
    public void perimeter(){
        Integer p;
        p = 2*(Length + breadth);
        System.debug('perimeter: '+p);
    }
    
}