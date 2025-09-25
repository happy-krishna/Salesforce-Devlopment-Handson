trigger opportunityTrigger on Opportunity (after insert,after delete,after update) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            task2Handler.afterInsertOpp(Trigger.new);
            task6Handler.aftercreateOpp(Trigger.new);
        }
        if(Trigger.isUpdate){
            task6Handler.afterUpdateOpp(Trigger.new,Trigger.OldMap);
        }
        if(Trigger.isDelete){
            
        }
    }
}