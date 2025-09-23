/**
    problem statement : 

    Trigger on Case(After Update) when Status changes from working to closed.
    1. be ensure AccountId on case not equal to null 
    2. Create a contact with LastName as Case.Subject with same related account 
         if no such contact exist for that Account.

**/

trigger caseTrigger on Case (after Update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            task3Handler.updateCaseStatus(Trigger.new,Trigger.oldMap);
        }
    }
}