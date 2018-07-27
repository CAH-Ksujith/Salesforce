public with sharing class AttachmentUploadController {
   public string recordid;
   public AttachmentUploadController (){
    recordid = System.currentPageReference().getParameters().get('id');
    }

  public Attachment attachment {
  get {
      if (attachment == null)
        attachment = new Attachment();
      return attachment;
    }
  set;
  }

  public PageReference upload() {
    
    try {
        attachment.OwnerId = UserInfo.getUserId();
        attachment.ParentId = recordid; 
        attachment.IsPrivate = true;
               
        insert attachment;
        
        Attachment latestID = [select id from attachment where parentid=:recordid ]  ;
        
        Interface_Test__c Attach = [select id,name,Account__c,Attach_Name__c,Attach_ID__c from Interface_Test__c where id=:recordid ] ;
        Attach.Attach_Name__c = attachment.name;
        Attach.Attach_ID__c = latestID.Id;  
        update Attach;
        
        PageReference orderPage = new PageReference('/' + Attach.Account__c);
        orderPage.setRedirect(true);
        return orderPage; 
        
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      return null;
    } 
  }
  
  public PageReference Cancel(){
        
        
        Interface_Test__c Attach = [select id,name,Account__c,Attach_Name__c,Attach_ID__c from Interface_Test__c where id=:recordid ] ;
        String Accountid = Attach.Account__c;
        Delete Attach ;
        PageReference orderPage = new PageReference('/' +Accountid);
        orderPage.setRedirect(true);
        return orderPage;
        }
}