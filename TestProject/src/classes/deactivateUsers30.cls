global class deactivateUsers30 implements Database.Batchable<SObject>{
    global Database.querylocator start(Database.BatchableContext bc){
       date dt = date.today()-30;
       String query = 'SELECT Name, LastLoginDate, createdDate, Id From User WHERE IsActive = true AND lastloginDate = null AND createdDate <= :dt ' ;
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
       Database.update(userList);
    }

    global void finish(Database.BatchableContext bc){}
}