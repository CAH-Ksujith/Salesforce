trigger CreateHistoryRecords on Timeplanning__c (before insert,before update) {
    
    list<Timeplanning_History__c> timeplanningHistoryList = new list<Timeplanning_History__c>();
    boolean run=true;
    for(Timeplanning__c tp : trigger.new){
        if(run==true){
            if(tp.Data_Conversion__c!=null || tp.Hardware_Install__c!=null || tp.Interface_Setup__c!=null|| tp.Meeting_Offsite__c!=null||
                    tp.Meeting_onsite__c!=null || tp.System_Configuration__c!=null || tp.System_Design__c!=null ||
                        tp.System_Testing__c!=null || tp.Training__c!=null || tp.Travelling__c!=null || tp.Other_Offsite__c!=null ||
                            tp.Other_Onsite__c!=null){
                Timeplanning_History__c tph = new Timeplanning_History__c();
                tph.name=tp.name;
                tph.Data_Conversion__c=tp.Data_Conversion__c;
                tph.Hardware_Install__c=tp.Hardware_Install__c;
                tph.Interface_Setup__c=tp.Interface_Setup__c;
                tph.Meeting_Offsite__c=tp.Meeting_Offsite__c;
                tph.Meeting_onsite__c=tp.Meeting_onsite__c;
                tph.System_Configuration__c=tp.System_Configuration__c;
                tph.System_Design__c=tp.System_Design__c;
                tph.System_Testing__c=tp.System_Testing__c;
                tph.Training__c=tp.Training__c;
                tph.Travelling__c =tp.Travelling__c;
                tph.Other_Offsite__c=tp.Other_Offsite__c;
                tph.Other_Onsite__c=tp.Other_Onsite__c;
                timeplanningHistoryList.add(tph);
            }
       }
    }
    insert timeplanningHistoryList; 
    Run=false;
  list<Timeplanning__c> UpdateList = new list<Timeplanning__c>();
    
    for(Timeplanning__c tUpdate: trigger.new){
        System.debug('********************');
        //Timeplanning__c  tUpdate= new Timeplanning__c();
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
        //UpdateList.add(tUpdate);
    }
    //Update UpdateList;
        
    
}