/**
* @company: TCS
* @question: Retrieve the names of Contacts whose parent Account has 
    at least one Opportunity with Amount > 1 Lakh.
**/  

public class SOQL1 {
    public static void soqlQuery(){
        for(Contact con : [Select Id, Name from Contact where AccountId 
                           IN (Select AccountId From Opportunity Where Amount > 100000)]){
           System.debug(con);                              
        }
    }
}