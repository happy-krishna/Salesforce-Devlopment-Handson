trigger ContactTrigger on Contact (before insert, after update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            task1Handler.beforeInsertContacts(Trigger.new);
        }
    }
    
    if(Trigger.isAfter){    
        if(Trigger.isUpdate){
            task1Handler.afterupdateContacts(Trigger.new, Trigger.OldMap);
        }
    }
}