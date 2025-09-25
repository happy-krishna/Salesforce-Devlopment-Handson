public class task6Helper {
    public static void insertorUpdatecopyPickListFromOpptoAcc(Map<Id,List<String>> accIdsWithPickList){
        List<Account> accList = new List<Account>();
        for(Account acc : [Select Id,Account_Multi_Picklist__c From Account Where Id IN: accIdsWithPickList.keySet()]){
            String ans = '';
            for(String str : accIdsWithPickList.get(acc.Id)){
                ans += str+';';
            }
            acc.Account_Multi_Picklist__c = ans;
            System.debug(acc);
            accList.add(acc);
        }
        if(accList.size()>0){
            Update accList;
        }
    }
}