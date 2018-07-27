public class UpdatingHoursAndTimeClass{

    public Static void m1(Map<id,List<String>> HoursMap){
    System.debug('**********HoursMap***********' +HoursMap);
    Map<ID,Integer> FinalHoursMap = new Map<ID,Integer>();

    integer count=0;    
    for(ID id: HoursMap.keyset()){
    
    count = 0;    
    for(String  s : HoursMap.get(id)){
        if(s.contains(' Hours')){
                   count+=Integer.valueof(s.remove(' Hours'));      
        }else if(s.contains(' Hour')){
                   count+=Integer.valueof(s.remove(' Hour'));            
        }
    }
     FinalHoursMap.put(id,count); 
   }
   System.debug('************FinalHoursMap*************'+FinalHoursMap);
   
   List<Timeplanning__c> FinalTPlist = new list<Timeplanning__c>();
   
   for(ID id : FinalHoursMap.keyset()){
       Timeplanning__c tp = new Timeplanning__c();
       tp.id=id;
       tp.Hours__c=String.valueof(FinalHoursMap.get(id));
       FinalTPlist.add(tp);
   }
   //Update FinalTPlist;
    
   }
}