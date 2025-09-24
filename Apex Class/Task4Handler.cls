/**
    Task 4 problem statement : 

    1. Automatically create number of contact Records based on Total_Number_of_Contacts__c field on account, when account record is created.
    2. make sure create contact records have unique last name.
 
**/
public class Task4Handler {
    public static void getTriggerAccount(List<Account> accNewList){
        Set<Id> accIds = new Set<Id>();
        //Fetching only Account whose Total_Number_of_Contacts__c not equal to null
        for(Account acc : accNewList){
            if(acc.Total_Number_of_Contacts__c!=null){
                accIds.add(acc.Id);
            }
        }
        Task4Helper.createContacts(accIds);
    }
}