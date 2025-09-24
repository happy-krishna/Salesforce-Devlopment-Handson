trigger accountTrigger on Account (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            Task4Handler.getTriggerAccount(Trigger.new);
        }
    }
}