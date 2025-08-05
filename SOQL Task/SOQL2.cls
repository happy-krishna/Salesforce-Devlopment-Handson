/**
* @company: Gratner
* @question: Suppose you have custom field Profit__c on Contact and each contact rolls up to an account.
     In one SOQL query return 
     Account Name, 
     Number of contacts for that account with profit__c>0 (alias contactCount)
     Total Profit (sum of Profit__c) accross the contacts (alias totalProfit)
     Only Include Accounts where totalProfit > 10K.
**/  
public class SOQL2 {
    public static void soqlQuery(){
        /* we use contact sObject it will throw this error - Loop variable must be a generic SObject or 
           List or a concrete SObject or List of: AggregateResult */
        for(AggregateResult con : [Select Account.Name, COUNT(Id) contactCount, Sum(Profit__c) totalProfit  From Contact 
                           where Profit__c > 0 Group by Account.Name Having Sum(Profit__c) > 10 ]){
           System.debug(con);                              
        }
    }
}