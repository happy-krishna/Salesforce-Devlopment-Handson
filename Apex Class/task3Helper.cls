public class task3Helper {
    public static void createContact(Set<Id> caseIdSet, Map<Id,Set<String>> lastNameMap){
        List<Contact> contactList = new List<Contact>();
        for(Case cs : [SELECT Id, AccountId, Subject FROM Case WHERE Id IN :caseIdSet]){
            if(!lastNameMap.get(cs.AccountId).contains(cs.Subject)){
                Contact con = new Contact();
                con.AccountId = cs.AccountId;
                con.LastName = cs.Subject;
                contactList.add(con);
            }
        }

        if(!contactList.isEmpty()){
            insert contactList;
        }          
    }
}