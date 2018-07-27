@isTest 
public class emailInactivateUsers90Test 
{
    static testMethod void testMethod1() 
    {
       /* List<Account> lstAccount= new List<Account>();
        for(Integer i=0 ;i <200;i++)
        {
            Account acc = new Account();
            acc.Name ='Name'+i;
            lstLead.add(acc);
        }
        
        insert lstAccount;*/
        
        Test.startTest();

            emailInactivateUsers90 obj = new emailInactivateUsers90();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}