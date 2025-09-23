public class task3Handler {
    public static void updateCaseStatus(List<Case> caseList,Map<Id,Case> oldMapList){
        Set<Id> caseIdSet = new Set<Id>();  // Store CaseId of Current Trigger
        Set<Id> accIdSet = new Set<Id>();  // Store AccountId of Current Trigger
        for(Case cs : caseList){
            if(cs.Status == 'Closed' && cs.AccountId != null && oldMapList.get(cs.Id).Status =='Working'){
                caseIdSet.add(cs.Id);
                accIdSet.add(cs.AccountId);
            }
        }
        
        // Storing LastName of Contact if any exist as Case.Subject with same related account.
        Map<Id,Set<String>> lastNameMap = new Map<Id,Set<String>>();
        for(Contact con : [Select Id,AccountId,LastName From Contact Where AccountId IN: accIdSet]){
            if(lastNameMap.containsKey(con.AccountId)==false){
                lastNameMap.put(con.AccountId,new Set<String>{con.LastName});
            }else{
                lastNameMap.get(con.AccountId).add(con.LastName);
            }
        }
        
        if(!caseIdSet.isEmpty()){
            task3Helper.createContact(caseIdSet,lastNameMap);
        }
    }
}