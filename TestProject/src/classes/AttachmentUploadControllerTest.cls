@isTest()
public class AttachmentUploadControllerTest{
  
  Static testmethod void AttachmentUploadTestMethod1(){
        
        Interface_Test__c t = new Interface_Test__c();
        insert t;
        
        PageReference myVfPage = Page.TEST_Interface;
        Test.setCurrentPage(myVfPage);
        
        ApexPages.currentPage().getParameters().put('id',t.id);
        
        AttachmentUploadController c = new AttachmentUploadController();
        c.attachment.name='Unit Test Attachment';
        c.attachment.body=Blob.valueOf('Unit Test Attachment Body');
        c.upload();
    }
   Static testmethod void AttachmentUploadTestMethod2(){
      
        Interface_Test__c t = new Interface_Test__c();
        insert t;
        
        PageReference myVfPage = Page.TEST_Interface;
        Test.setCurrentPage(myVfPage);
        
        ApexPages.currentPage().getParameters().put('id',t.id);
        
        AttachmentUploadController c = new AttachmentUploadController();
        c.Cancel();
    } 
    
    Static testmethod void AttachmentUploadTestMethod3(){
        
        Interface_Test__c t = new Interface_Test__c();
        insert t;
        
        PageReference myVfPage = Page.TEST_Interface;
        Test.setCurrentPage(myVfPage);
        
        AttachmentUploadController c = new AttachmentUploadController();
        c.attachment.name='Unit Test Attachment';
        c.attachment.body=Blob.valueOf('Unit Test Attachment Body');
        c.upload();
    }

}