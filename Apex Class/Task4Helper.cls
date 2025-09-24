public class Task4Helper {
    public static void createContacts(Set<Id> accIds){
        List<Contact> conIds = new List<Contact>();
        for(Account acc : [Select Id, Name, Total_Number_of_Contacts__c From Account Where Id IN: accIds]){
            for(Integer i=1;i<=acc.Total_Number_of_Contacts__c;i++){
                Contact con = new Contact();
                con.LastName = i + ' Contact of '+acc.Name;
                con.AccountId = acc.Id;
                conIds.add(con);
            }
        }
        if(!conIds.isEmpty()){
            Database.insert(conIds);
        }
    }
}