trigger UpdatingHoursAndTime on Timeplanning__c (before insert,before update) {
    list<String> MeetingOffsiteList = new list<String>();
    list<String> MeetingOnsiteList = new list<String>();
    list<String> HardwareInstallList= new list<String>();
    list<String> DataConversionList= new list<String>();
    list<String> InterfaceSetupList= new list<String>();
    list<String> SystemDesignList= new list<String>();
    list<String> SystemConfigurationList = new list<String>();
    list<String> SystemTestingList= new list<String>();
    list<String> TrainingList= new list<String>();
    list<String> TravellingList= new list<String>();
    list<String> OtherOnsiteList= new list<String>();
    list<String> OtherOffsiteList= new list<String>();
    
    Map<ID,list<String>> HoursMap = new Map<ID,list<String>>();
    Map<ID,Double> FinalHoursMap = new Map<ID,Double>();
    Map<ID,Integer> FinalMinutesMap = new Map<ID,Integer>();
    
    list<String> FinalList= new list<String>();
    
    //Getting all values into List splitting multi picklist with ';'
    for(Timeplanning__c  tp: trigger.new){
    
        if(tp.Meeting_Offsite__c!=null){
            MeetingOffsiteList = tp.Meeting_Offsite__c.split(';');
        }

        if(tp.Meeting_Onsite__c!=null){
            MeetingOnsiteList = tp.Meeting_Onsite__c.split(';');
        }
        
        if(tp.Hardware_Install__c!=null){
            HardwareInstallList= tp.Hardware_Install__c.split(';');    
        }

        if(tp.Data_Conversion__c!=null){
            DataConversionList= tp.Data_Conversion__c.split(';');    
        }

        if(tp.Interface_Setup__c!=null){
            InterfaceSetupList= tp.Interface_Setup__c.split(';');    
        }

        if(tp.System_Design__c!=null){
            SystemDesignList= tp.System_Design__c.split(';');    
        }

        if(tp.System_Configuration__c!=null){
            SystemConfigurationList = tp.System_Configuration__c.split(';');    
        }

        if(tp.System_Testing__c!=null){
            SystemTestingList= tp.System_Testing__c.split(';');    
        }  
                                                
        if(tp.Training__c!=null){
            TrainingList= tp.Training__c.split(';');    
        }
        
        if(tp.Travelling__c!=null){
            TravellingList= tp.Travelling__c.split(';');    
        }
        
        if(tp.Other_Onsite__c!=null){
            OtherOnsiteList= tp.Other_Onsite__c.split(';');    
        }
        
        if(tp.Other_Offsite__c!=null){
            OtherOffsiteList= tp.Other_Offsite__c.split(';');    
        }
        
        //Adding all List values into one list ascstirngs
        if(MeetingOffsiteList.size()!=0)
        FinalList.addAll(MeetingOffsiteList);

        if(MeetingOnsiteList.size()!=0)        
        FinalList.addAll(MeetingOnsiteList);

        if(HardwareInstallList.size()!=0)
        FinalList.addAll(HardwareInstallList);

        if(DataConversionList.size()!=0)
        FinalList.addAll(DataConversionList);

        if(InterfaceSetupList.size()!=0)
        FinalList.addAll(InterfaceSetupList);

        if(SystemDesignList.size()!=0)
        FinalList.addAll(SystemDesignList);

        if(SystemConfigurationList.size()!=0)
        FinalList.addAll(SystemConfigurationList);

        if(SystemTestingList.size()!=0)
        FinalList.addAll(SystemTestingList);

        if(TrainingList.size()!=0)
        FinalList.addAll(TrainingList);

        if(TravellingList.size()!=0)
        FinalList.addAll(TravellingList);

        if(OtherOnsiteList.size()!=0)
        FinalList.addAll(OtherOnsiteList);

        if(OtherOffsiteList.size()!=0)
        FinalList.addAll(OtherOffsiteList);
        
        //Putting ID of the record as Key and Final list as values in MAP
        HoursMap.put(tp.id,FinalList);
    }
    
    
    
    Decimal countHours=0;    
    integer countMinutes=0;  
      
    for(ID id: HoursMap.keyset()){
     
     //Calculating Hours 
     for(String  s : HoursMap.get(id)){
         countHours+=Decimal.valueof(s); 
     }
     
     FinalHoursMap.put(id,countHours); 
     
     //Calcuting Minutes
     String StrMin = String.valueof(countHours).substringAfter('.');

     if(StrMin =='25'){
         countMinutes=15;
     }else if(StrMin =='50'){
         countMinutes=30;
     }else if(StrMin =='75'){
         countMinutes=45;
     }else{
         countMinutes=0;
     }
     
     FinalMinutesMap.put(id,countMinutes); 
    }
    /*
    System.debug('**********FinalMinutesMap*********' +FinalMinutesMap);
    
    Integer Hours=0;
    Integer Min=0;
    Map<ID,Integer> FinalMinutesToHours = new Map<ID,Integer>();
    Map<ID,Integer> FinalMinutesToMinutes = new Map<ID,Integer>();
    
    
    //Minutes Calculation
    for(ID id: FinalMinutesMap.keyset()){
            
            if(FinalMinutesMap.get(id)>=60){
                Hours=FinalMinutesMap.get(id)/60;
                Min = math.mod(FinalMinutesMap.get(id),60);
            }else{
                Min=FinalMinutesMap.get(id);
            }
            
            System.debug('******Min********'+Min);
            
            FinalMinutesToHours.put(id,Hours);
            FinalMinutesToMinutes.put(id,Min);
    }*/
    
    
    System.debug('************FinalHoursMap*************'+FinalHoursMap);
    System.debug('**********FinalMinutesMap*********' +FinalMinutesMap);


    //Inserting or Updating Hours and Minutes values into record below
    for(Timeplanning__c  tp : trigger.new){
        
        if(FinalHoursMap.containsKey(tp.id)){
            
            if(FinalHoursMap.get(tp.id)>8){
                tp.Hours__c='8';
            }else{
                tp.Hours__c=String.valueof(Integer.valueof(FinalHoursMap.get(tp.id)));            
            }
        }
        
        if(FinalMinutesMap.containsKey(tp.id)){
            if(FinalHoursMap.containsKey(tp.id)){
                if(FinalHoursMap.get(tp.id)>8){
                    tp.Minutes__c='0';
                }else{
                    tp.Minutes__c=String.valueof(FinalMinutesMap.get(tp.id));
                }
            }else{
                    tp.Minutes__c=String.valueof(FinalMinutesMap.get(tp.id));            
            } 
        }
        
    }//Close For
}