global class emailInactivateUsers90 implements Database.Batchable<SObject>{
    global Database.querylocator start(Database.BatchableContext bc){
       date dt = date.today()-90;
       String query = 'SELECT Name, LastLoginDate, Id From User WHERE IsActive = true AND lastloginDate < :dt ' ;
       return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<User> scope){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        if(scope.size() > 0){
            for(User usr : scope)
            {              
                //toAddresses.add(usr.email);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setHtmlBody('Hi '+ usr.name +',<br/><br/> You have not logged in to salesforce from past 90. Please login into your account to avoid deactivation <br/><br/> Thanks');
                mail.setSubject('User deactivation notification');
                mail.setTargetObjectId(usr.Id); 
                mail.setSaveAsActivity(false);
                mails.add(mail);
            }
            Messaging.sendEmail(mails);
        }
    }
    global void finish(Database.BatchableContext bc){}
}