@isTest()
Public class CreateTimeplaningHistoryTest{
    Static testmethod void CreateTimeplaningHistoryMethod(){
        Timeplanning__c t = new Timeplanning__c();
        t.Role__c='Trainer';
        t.Date__c=Date.newInstance(2017, 6, 22);
        t.Field__c='adnvkjdsvnjkdsvn';
        insert t;
        
        PageReference myVfPage = Page.TimePlanningRecordHistoryCreationPage;
        Test.setCurrentPage(myVfPage);
        
        // Put Id into the current page Parameters
        ApexPages.currentPage().getParameters().put('id',t.id);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(t);

        CreateTimeplaningHistory c = new CreateTimeplaningHistory(sc);
        c.saveHistory();
    }
}