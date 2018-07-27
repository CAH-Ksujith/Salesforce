@isTest 
public class deactivateUsers120Test {
    static testMethod void testMethod1(){
        Test.startTest();
        deactivateUsers120 obj = new deactivateUsers120();
        DataBase.executeBatch(obj); 
        Test.stopTest();
    }
}