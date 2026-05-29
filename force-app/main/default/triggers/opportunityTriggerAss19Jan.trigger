trigger opportunityTriggerAss19Jan on Opportunity (after insert, after update) {

    Set<Id> setOpp = new Set<Id>();
    for(Opportunity ObjOpp:trigger.new){
        if(objOpp.AccountId != null){
            setOpp.add(objOpp.AccountId);
        }
    }
    
    Map<Id, Account> mapAcc = new Map<Id,Account>([select id, Name, SLA__c  from Account where Id IN:setOpp]);
    
    if(!mapAcc.isEmpty()){
        for(Opportunity ObjOpp:trigger.new){
            if(mapAcc.containsKey(objOpp.AccountId) &&
                objOpp.Amount != null && objOpp.Amount <= 8000 && 
                objOpp.StageName == 'Closed Lost'){
                Account acc = mapAcc.get(objOpp.AccountId);
                acc.SLA__c = 'Silver';
                mapAcc.put(objOpp.AccountId, acc);
               }
        }
        DataBase.update(mapAcc.values(),false);
    }
}