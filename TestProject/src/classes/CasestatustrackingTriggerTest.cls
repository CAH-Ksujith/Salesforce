@isTest
Public class CasestatustrackingTriggerTest{

Static testmethod void CreateTimeplaningHistorym1(){

        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        testAccount.Account_Manager__c='Russell Rossix';
        insert testAccount;
        
        Contact cont = new Contact ();
        cont.LastName ='Test';
        cont.FirstName ='Test';
        cont.accountid = testAccount.id;
        insert cont;

        Case cse = new Case();
        cse.Accountid = testAccount.id;
        cse.Contactid = cont.id;
        cse.Description = 'TestDescription';
        cse.Status = 'New';
        cse.Subject = 'TestSubject';
        cse.Problem_Area__c='Software';
        cse.Product_Area__c='Cabinet';
        cse.Sub_Product__c='CCF';
        cse.Origin='Answernet';
        cse.Contact_Time__c=Date.newInstance(2017,6,6);
        cse.Severity__c='S1';
        cse.Priority='Low';
        insert cse;
        
        Case c = [select id,status from Case where Status='New'];
        c.status='Deferred';
        update c;
        

   // Test.StartTest();
        //PageReference pageRef = Page.TimePlanningRecordHistoryCreationPage;
        //Test.setCurrentPage(pageRef);
        //ApexPages.currentPage().getParameters().put('qp', 'yyyy');
       
     
    
    //Test.StopTest();
}

}