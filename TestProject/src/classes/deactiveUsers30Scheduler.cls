global class deactiveUsers30Scheduler implements Schedulable {
    global void execute(SchedulableContext ctx) {
        deactivateUsers30 job = new deactivateUsers30();
		Database.executebatch(job,200);
    }
    
}