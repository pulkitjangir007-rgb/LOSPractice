@isTest
private class RectangleWithStaticMethodsTest {
    @isTest
    private static void testArea(){
        Integer res = RectangleWithStaticMethods.area(10,20);
        system.assertEquals(200, res,'Area is not calculated Correctly');
    }
    @isTest
    private static void testPerimeter(){
        Integer res = RectangleWithStaticMethods.perimeter(10,20);
        system.assertEquals(60, res,'Area is not calculated Correctly');
    }  
}