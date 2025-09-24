/** 
 Create a custom field on Account  - Address__c(Text) 
 Create custom field on Contact - contact_Address(Text), Is_Active__c(checkbox) 
 
 1. When a contact is created under account  whose Is_Active__c(checkbox)  value equal true, 
   then account Address__c should automatically copy to contact contact_Address(Text). 
 
 2. If an active contact address is updated then it's account address also be updated with contact address. 
   after that all active contatcts under same account should sync thier contact_Address with updated account Address__c 

 Apex Trigger Name : ContactTrigger

**/
public class task1Handler {
    public static void beforeInsertContacts(List<Contact> conNewList){
        System.debug('Handler Class Method 1');
        Set<Id> accIds = new Set<Id>();
        Map<Id,String> accIdMap = new Map<Id,String>();
        for(Contact con : conNewList){
            if(con.Is_Active__c==true && con.AccountId!=null){
                accIds.add(con.AccountId);
            }
        }
        for(Account acc : [Select Id,Account_Address__c From Account Where Id IN: accIds]){
            accIdMap.put(acc.Id,acc.Account_Address__c);
        }
        task1Helper.addressUpdateonCreate(conNewList,accIdMap);
    }
    
    public static void afterupdateContacts(List<Contact> conNewList, Map<Id,Contact> conOldMap){
        Map<Id,String> addressMap = new Map<Id,String>();
        for(Contact con : conNewList){
            if(con.Contact_Address__c!=null){
                if(con.Is_Active__c==true && conOldMap.get(con.Id).Contact_Address__c!=con.Contact_Address__c && con.Contact_Address__c!=null){
                    addressMap.put(con.Id,con.Contact_Address__c);
                }
            }
        }
        task1Helper.addressUpdateallCon(addressMap);
    }
}