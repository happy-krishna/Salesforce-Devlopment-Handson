trigger caseTrigger on Case (after Update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            task3Handler.updateCaseStatus(Trigger.new,Trigger.oldMap);
        }
    }
}