trigger CasestatustrackingTrigger on Case (before update,before insert) { 
  
    if (Trigger.isBefore){
    
        if (Trigger.isinsert){
         
            for(case sNew : trigger.new){        
               
                    snew.Case_Status_change_Date__c = system.now();

              }
           }
    
        if (Trigger.isUpdate){
        
            for(case sNew : trigger.new){
            
                system.debug('snew.Case_Status_change_Date__c++'+snew.Case_Status_change_Date__c);
                
                if(trigger.oldmap.get(sNew.id).Case_Status_change_Date__c == null){
                    snew.Case_Status_change_Date__c=trigger.oldmap.get(sNew.id).LastModifiedDate;
                }
                
                
                if((trigger.oldmap.get(sNew.id).status != trigger.newmap.get(sNew.id).Status)){
                
                    Case_Status_Tracking__c caserec= new Case_Status_Tracking__c();
                    
                    caserec.Case_Number__c = sNew.CaseNumber;
                    caserec.Case_Status__c=trigger.oldmap.get(sNew.id).status;
                    
                    datetime x=snew.Case_Status_change_Date__c;
                    datetime Currentdate=system.now();
                    System.debug('********Case_Status_change_Date__c   x**********'+x);
                    System.debug('********Currentdate**********'+Currentdate);
                    
                    Decimal days=(Decimal.valueOf(Currentdate.getTime() - x.getTime()))/1000/60/60/24;
                    
                    decimal decHours = ((Currentdate.getTime())/1000/60/60) - ((x.getTime())/1000/60/60);

                    
                    //decimal dHours = Currentdate.hour()-x.hour();//timeCalculationClass.GetElapsedHours(Currentdate,X);
                    decimal dMinutes = Currentdate.minute()-X.minute();//timeCalculationClass.GetElapsedHours(Currentdate,X);
                    
                    System.debug('**********dMinutes************'+dMinutes);
                    //system.debug('********dHours*******************'+dHours);
                    system.debug('***********days****************'+days);
                    
                    
                    //integer iHours = integer.valueOF(math.floor(((days*24)+dHours)));
                    system.debug('**********decHours ***************'+decHours );
                    
                    if(decHours>=1 && dMinutes<=0){
                    caserec.Status_Duration__c=decHours-1;
                    }else{
                    caserec.Status_Duration__c=decHours;                    
                    }

                    
                    
                    if(dMinutes>=0){                    
                        caserec.Minutes__c=dMinutes;
                    }else{
                        System.debug('************Minus***********************'+dMinutes);
                        //caserec.Status_Duration__c=0;
                        caserec.Minutes__c=60+dMinutes;                    
                    }
                    snew.Case_Status_change_Date__c=system.now();
                    insert caserec;
                    system.debug('snew.caserec++'+caserec);                    
                }
            }
        }
    }
    
}