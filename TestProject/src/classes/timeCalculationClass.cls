Public class timeCalculationClass{
    
    public static Decimal GetElapsedTime(DateTime startTime, DateTime endTime){
        
        if(startTime == null || endTime == null)
            return 0;

    System.debug('**********startTime******************'+startTime);
    System.debug('**********endTime******************'+endTime);
    
    System.debug('**********endTime.hour()******************'+endTime.hour());
    System.debug('**********startTime.hour()******************'+startTime.hour());

        Decimal elapsedHours = endTime.hour() - startTime.hour();//((Decimal.valueOf(startTime.getTime() - endTime.getTime()))/1000/60/60/24);
        Integer elapsedMinutes = endTime.minute() - startTime.minute();
        Integer elapsedSeconds = endTime.second() - startTime.second();
        Integer elapsedMiliseconds = endTime.millisecond() - startTime.millisecond();
    
        return elapsedHours;
        //return Time.newInstance(elapsedHours, elapsedMinutes, elapsedSeconds, elapsedMiliseconds);
   
   }
   
   public static Decimal GetElapsedHours(DateTime startDate, DateTime endDate){
              System.debug('************GetElapsedTime(startDate, endDate)*********'+GetElapsedTime(startDate, endDate));

       return GetElapsedTime(startDate, endDate);//.hour();
   }
   
   public static Decimal GetElapsedMinutes(DateTime startDate, DateTime endDate){
   
       return GetElapsedTime(startDate, endDate);//.minute();
   }
   
   public static Decimal GetSecondsElapsed(DateTime startTime, DateTime endTime){
   
       return GetElapsedTime(startTime, endTime);//.second();
   }
 
}