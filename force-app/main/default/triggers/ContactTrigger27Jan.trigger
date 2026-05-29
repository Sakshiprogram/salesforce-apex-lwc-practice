trigger ContactTrigger27Jan on Contact (after insert, after update, after delete, after undelete) {

    Set<Id> setAcc = new Set<Id>();
        
        if(trigger.isafter && (trigger.isInsert  ||  trigger.isUpdate  ||  trigger.isUndelete)){
            for(Contact objCon:trigger.new){
                if(objCon.AccountId != null){
                    setAcc.add(objCon.AccountId);
                }
            }
        }
    
            if(trigger.isafter && (trigger.isUpdate || trigger.isDelete)){
            for(Contact objCon:trigger.old){
                if(objCon.AccountId != null){
                    setAcc.add(objCon.AccountId);
                }
                }
            }
    
    Map<Id, Account> mapAcc = new Map<Id, Account>([Select Id, Count_of_Contacts__c,(Select Id from Contacts) from Account where Id IN :setAcc]);
    
    if(!mapAcc.isEmpty()){ 
     if(trigger.isafter && (trigger.isInsert  ||  trigger.isUpdate  ||  trigger.isUndelete)){
            for(Contact objCon:trigger.new){
                if(mapAcc.containsKey(objCon.AccountId)){
                    mapAcc.get(objCon.AccountId).Count_of_Contacts__c= mapAcc.get(objCon.AccountId).Contacts.size();
                }
            }
        }
       
        
           if(trigger.isafter && (trigger.isUpdate  ||  trigger.isDelete)){
            for(Contact objCon:trigger.old){
             if(mapAcc.containsKey(objCon.AccountId)){
               mapAcc.get(objCon.AccountId).Count_of_Contacts__c= mapAcc.get(objCon.AccountId).Contacts.size();
                }
                }
            }        
        
    }
      DataBase.update(mapAcc.values(), false);
}