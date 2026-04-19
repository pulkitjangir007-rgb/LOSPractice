@isTest
private class CalculatorTest {
    @isTest
    private static void testadd(){
        Integer add = Calculator.add(10,20);
        system.assertEquals(30,add,'Addition not working properly');
    }
        @isTest
    private static void testsub(){
        Integer sub = Calculator.sub(20,10);
        system.assertEquals(10,sub,'substraction not working properly');
    }

        @isTest
    private static void testmulti(){
        Integer multi = Calculator.multi(10,20);
        system.assertEquals(200,multi,'multiply not working properly');
    }

        @isTest
    private static void testdivide(){
        Decimal divide = Calculator.divide(20,10);
        system.assertEquals(2,divide,'divide not working properly');
    }


}