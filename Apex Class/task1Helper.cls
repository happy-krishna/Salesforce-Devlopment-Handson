/*
  1. When you create a new record (e.g. a Contact) but haven't inserted it yet, it 
     doesn't exist in the database, so Salesforce can't access related data (like Account.Name) 
     through relationships unless you query it yourself.
  2. Trigger.new is read-only in after triggers
  3. Trigger.old is always read-only
*/

public class task1Helper {
    public static void addressUpdateonCreate(List<Contact> conNewList,Map<Id,String> accIdMap){
        System.debug('Helper Class Method 1');
        for(Contact con : conNewList){
            System.debug(con.Account.Account_Address__c);
            con.Contact_Address__c = accIdMap.get(con.AccountId);
        }
    }
    
    public static void addressUpdateallCon(Map<Id,String> addressMap){
        List<Account> allaccIds = new List<Account>();
        for(Contact con : [Select Id, AccountId, Contact_Address__c From Contact 
                           Where Id IN: addressMap.keySet()]){
                 Account acc = new Account(Id = con.AccountId) ;
                 acc.Account_Address__c = con.Contact_Address__c;
                 allaccIds.add(acc);
        }
        
        
        if(allaccIds.size()>0){
            update allaccIds;
            Set<Id> accIds = new Set<Id>();
            for(Account acc : allaccIds){
                accIds.add(acc.Id);
            }
            
            List<Contact> updateconIds = new List<Contact>();
            
            for(Contact con : [Select Id, Account.Account_Address__c From Contact 
                           Where Id NOT IN: addressMap.keySet() AND AccountId IN: accIds]){
                 Contact newCon = new Contact(Id = con.Id);
                 newCon.Contact_Address__c = con.Account.Account_Address__c;
                 updateconIds.add(newCon);  
            }
            
            if(updateconIds.size()>0){
                Database.update(updateconIds);
            }
        }
        
    }
}