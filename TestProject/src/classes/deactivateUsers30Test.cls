@isTest 
public class deactivateUsers30Test 
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
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@parcop.com');
        Insert u;    
        Test.startTest();

            deactivateUsers30 obj = new deactivateUsers30();
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}