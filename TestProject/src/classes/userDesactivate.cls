global class userDesactivate implements Database.Batchable<SObject>{
    global Database.querylocator start(Database.BatchableContext bc){
       date dt = date.today()-365;
       String query = 'SELECT Name, LastLoginDate, Id From User WHERE IsActive = true AND lastloginDate != null AND lastloginDate < :dt ' ;
       return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<User> scope){
        List<User> userList = new List<User>();
        if(scope.size() > 0)
        {
            for(User usr : scope)
            {
                usr.isActive = false;
                userList.add(usr);
            }
        }
       Database.SaveResult[] srList = Database.update(userList, false);
    }

    global void finish(Database.BatchableContext bc){}
}