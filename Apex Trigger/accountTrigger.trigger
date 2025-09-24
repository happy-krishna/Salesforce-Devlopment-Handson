/**
    problem statement : 

    Automatically create number of contact Records based on Total_Number_of_Contacts__c field on account, when account record is created.
     make sure create contact records have unique last name.
 
**/
trigger accountTrigger on Account (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            Task4Handler.getTriggerAccount(Trigger.new);
        }
    }
}