public class ContactTrigger3FebHelper {

public static void countofContact(List<Contact> conList){
    
    Set<Id> setAcc = new Set<Id>();
    
    for(Contact objCon:conList){
        if(objCon.AccountId !=null){
            setAcc.add(objCon.AccountId);
        }
        }
  

    Map<Id,Account> mapAcc = new Map<Id,Account>();

    for(Account objAcc:[Select Id, Count_of_Contacts__c,(Select Id from Contacts) from Account where Id IN:setAcc]){
        objAcc.Count_of_Contacts__c=objAcc.Contacts.size();
        mapAcc.put(objAcc.Id,objAcc);
    }

    if(!mapAcc.isEmpty()){ 
        Database.update(mapAcc.values(),false);
    }
}
}