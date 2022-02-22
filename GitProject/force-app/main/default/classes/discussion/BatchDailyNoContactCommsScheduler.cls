global class BatchDailyNoContactCommsScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        BatchDailyNoContactComms noContact = new BatchDailyNoContactComms();
        Database.executeBatch(noContact, 100);
    }
}