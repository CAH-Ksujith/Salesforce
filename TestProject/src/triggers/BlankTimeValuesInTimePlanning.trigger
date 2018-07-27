trigger BlankTimeValuesInTimePlanning on Timeplanning_History__c (before insert) {
    Set<ID> TimePlanIDs = new Set<ID>();
    
    for(Timeplanning_History__c  th : trigger.new){
        if(th.Timeplanning_Record_ID__c!=null){
            TimePlanIDs.add(th.Timeplanning_Record_ID__c);   
        }
    }
    
    list<Timeplanning__c> TimePlanningList = [select id,name,Data_Conversion__c,Hardware_Install__c,Interface_Setup__c,Hours__c,
                                             Meeting_Offsite__c,Meeting_onsite__c,Other_Offsite__c,Other_Onsite__c,
                                             System_Configuration__c,System_Design__c,System_Testing__c,Training__c,Travelling__c 
                                             from Timeplanning__c where id in:TimePlanIDs];
    
    list<Timeplanning__c> UpdateList = new list<Timeplanning__c>();
    
    for(Timeplanning__c tp : TimePlanningList){
        Timeplanning__c  tUpdate= new Timeplanning__c();
        tUpdate.Data_Conversion__c='';
        tUpdate.Hardware_Install__c='';
        tUpdate.Interface_Setup__c='';
        //tUpdate.Hours__c='';
        tUpdate.Meeting_Offsite__c='';
        tUpdate.Meeting_onsite__c='';
        tUpdate.System_Configuration__c='';
        tUpdate.System_Design__c='';
        tUpdate.System_Testing__c='';
        tUpdate.Training__c='';
        tUpdate.Travelling__c ='';
        tUpdate.Other_Offsite__c='';
        tUpdate.Other_Onsite__c='';
        UpdateList.add(tUpdate);
    }
    Update UpdateList;
}