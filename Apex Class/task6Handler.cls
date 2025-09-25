/*
    Task 6 problem statement : 

    Have a multi-picklist in Account and Opportunity with values 'A, B, C, D, E ,F' 
 
    Whenever an Opportunity is inserted or updated, the associated Account's multi-select picklist should 
    be updated with the values from the related Opportunity's picklist.

    Apex Trigger Name : opportunityTrigger
 
*/
public class task6Handler {
    public static void aftercreateOpp(List<Opportunity> newOppList){
        Map<Id,List<String>> accIdsWithPickList = new Map<Id,List<String>>();
        for(Opportunity opp : newOppList){
            if(opp.AccountId!=Null){
                List<String> oppPickList = opp.Opportunity_Multi_Picklist__c != null ? opp.Opportunity_Multi_Picklist__c.split(';') : new List<String>();
                accIdsWithPickList.put(opp.AccountId,oppPickList);
            }
        }
        task6Helper.insertorUpdatecopyPickListFromOpptoAcc(accIdsWithPickList);
    }
    
    public static void afterUpdateOpp(List<Opportunity> newOppList,Map<Id,Opportunity> oppOldMap){
        Map<Id,List<String>> accIdsWithPickList = new Map<Id,List<String>>();
        for(Opportunity opp : newOppList){
            if(opp.AccountId!=Null && opp.Opportunity_Multi_Picklist__c!=oppOldMap.get(opp.Id).Opportunity_Multi_Picklist__c){
                List<String> oppPickList = opp.Opportunity_Multi_Picklist__c != null ? opp.Opportunity_Multi_Picklist__c.split(';') : new List<String>();
                accIdsWithPickList.put(opp.AccountId,oppPickList);
            }
        }
        task6Helper.insertorUpdatecopyPickListFromOpptoAcc(accIdsWithPickList);
    }
    
}