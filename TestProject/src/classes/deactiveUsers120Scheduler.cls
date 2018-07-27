global class deactiveUsers120Scheduler implements Schedulable {
    global void execute(SchedulableContext ctx) {
        deactivateUsers120 job = new deactivateUsers120();
		Database.executebatch(job,200);
    }
    
}