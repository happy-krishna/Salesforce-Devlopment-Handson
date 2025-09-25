public class task6Helper {
    public static void insertorUpdatecopyPickListFromOpptoAcc(Map<Id,List<String>> accIdsWithPickList){
        List<Account> accList = new List<Account>();
        for(Account acc : [Select Id,Account_Multi_Picklist__c From Account Where Id IN: accIdsWithPickList.keySet()]){
            acc.Account_Multi_Picklist__c = String.join(accIdsWithPickList.get(acc.Id), ';');
            System.debug(acc);
            accList.add(acc);
        }
        if(accList.size()>0){
            Update accList;
        }
    }
}