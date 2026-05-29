trigger ContactTrigger19Jan on Contact (after insert, after update) {

    Set<Id> setId = new Set<Id>();
    
    for(Contact objCon:trigger.new){
        if(objCon.AccountId !=null){
            setId.add(objCon.AccountId);
        }
                }
    
    Map<Id,Account> mapAcc = new Map<Id,Account>([Select Id, Name, Description from Account where Id IN:setId]);
    
    if(!mapAcc.isEmpty()){
        for(Contact objCon:trigger.new){
            if(mapAcc.containskey(objCon.AccountId)){
                mapAcc.get(objCon.AccountId).Description = objCon.FirstName +''+ objCon.LastName;
            }
        }
        DataBase.update(mapAcc.values(),false);
    }
}