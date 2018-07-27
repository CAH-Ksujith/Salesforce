public class CreateTimeplaningHistory {
    public Timeplanning__c tp;
   
    public Timeplanning__c tp1{get;set;}
    ID RecordID;
    public CreateTimeplaningHistory(ApexPages.StandardController controller) {
        this.tp=   (Timeplanning__c)controller.getRecord();
        RecordID = ApexPages.currentPage().getParameters().get('id');
        PageReference pageref= new pagereference('/apex/TestPage?RecordID');
        tp1=[select id,name,Project_Number__c,Project__r.Current_Stage__c,Description__c,Implementation__c,Field__c,Project_Manager__c,Project__r.name,Other_Offsite__c,Project__c,  Project_Phase__c ,Other_Onsite__c ,Travelling__c,Training__c,System_Testing__c ,System_Configuration__c,System_Design__c ,Account__r.name,Interface_Setup__c ,Data_Conversion__c ,Meeting_onsite__c,Hardware_Install__c ,Meeting_Offsite__c ,Project_Manager__r.name,Account_Address__c,Order_Form_No__c,Account_Manager__c,Department__c,Phase__c,Role__c,Date__c
        from Timeplanning__c  where id=:RecordID];
    }
    
    public pagereference saveHistory(){
    
                Timeplanning_History__c tph = new Timeplanning_History__c();
                
                tph.Project_Manager__c = tp1.Project_Manager__c;
                tph.Account__c= tp1.Account__r.name;
                tph.Project_Number__c = tp1.Project_Number__c;
                tph.Project_Manager__c= tp1.Project_Manager__r.name;
                tph.Account_Address__c= tp1.Account_Address__c;
                tph.Order_Form_No__c= tp1.Order_Form_No__c;
                tph.Account_Manager__c = tp1.Account_Manager__c;
                tph.Department__c= tp1.Department__c;               
                tph.Project__c = tp1.Project__c;
                tph.Role__c= tp1.Role__c;
                tph.Date__c= tp1.Date__c;
                tph.Description__c= tp1.Description__c;
                tph.Modified_Userr__c = userinfo.getuserId();
                
                tph.name=tp1.name;
                tph.Data_Conversion__c=tp1.Data_Conversion__c;
                tph.Hardware_Install__c=tp1.Hardware_Install__c;
                tph.Interface_Setup__c=tp1.Interface_Setup__c;
                tph.Meeting_Offsite__c=tp1.Meeting_Offsite__c;
                tph.Meeting_onsite__c=tp1.Meeting_onsite__c;
                tph.System_Configuration__c=tp1.System_Configuration__c;
                tph.System_Design__c=tp1.System_Design__c;
                tph.System_Testing__c=tp1.System_Testing__c;
                tph.Training__c=tp1.Training__c;
                tph.Travelling__c =tp1.Travelling__c;
                tph.Other_Offsite__c=tp1.Other_Offsite__c;
                tph.Other_Onsite__c=tp1.Other_Onsite__c;
                tph.Implementation__c=tp1.Implementation__c;
                
                Timeplanning__c newTP = new Timeplanning__c();
                
                newTP.id = tp1.id;
                newTP.Project_Manager__c = tp1.Project_Manager__c;
                newTP.Account__c= tp1.Account__c;                
                newTP.Project_Manager__c= tp1.Project_Manager__c;                
                newTP.Order_Form_No__c= tp1.Order_Form_No__c;                
                newTP.Department__c= tp1.Department__c;
                newTP.Phase__c= tp1.Phase__c;
                newTP.Field__c= tp1.Field__c;
                newTP.Role__c= tp1.Role__c;
                newTP.Date__c= tp1.Date__c;
                newTP.Project__c= tp1.Project__c;
                
                insert tph;
                update newTP;
                PageReference pageRef = new PageReference('/'+tph.id);
                pageRef.setRedirect(true);

        return pageRef;    
   }
}