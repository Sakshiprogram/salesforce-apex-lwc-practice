trigger AddressTrigger28Jan on Address__c (after insert, after update, after delete, after undelete) {

    Set<Id> setApp= new Set<Id>();
        
        if(trigger.isafter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
            for(Address__c objAdd:trigger.new){
                if(objAdd.Applicant__c != null){
                    setApp.add(objAdd.Applicant__c);
                }
        }
        }
    
    
    if(trigger.isafter && (trigger.isUpdate || trigger.isDelete)){
        for(Address__c objAdd:trigger.old){
           if(objAdd.Applicant__c != null){
                    setApp.add(objAdd.Applicant__c);
                }
    }
}
    
    Map<Id,Applicant__c> mapApp = new Map<Id,Applicant__c>([Select Id, Count_of_Address__c,(Select Id from Addresses__r) from Applicant__c where Id IN :setApp]);
    
      
    if(!mapApp.isEmpty()){ 
        if(trigger.isafter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
            for(Address__c objAdd:trigger.new){
                if(mapApp.containsKey(objAdd.Applicant__c)){
                    mapApp.get(objAdd.Applicant__c).Count_of_Address__c = mapApp.get(objAdd.Applicant__c).Addresses__r.size();
                }
            }
        }
        
          if(trigger.isafter && (trigger.isUpdate || trigger.isDelete)){
        for(Address__c objAdd:trigger.old){
         if(mapApp.containsKey(objAdd.Applicant__c)){
                    mapApp.get(objAdd.Applicant__c).Count_of_Address__c = mapApp.get(objAdd.Applicant__c).Addresses__r.size();
                }
        }
          }
    }
      DataBase.update(mapApp.values(), false);
}