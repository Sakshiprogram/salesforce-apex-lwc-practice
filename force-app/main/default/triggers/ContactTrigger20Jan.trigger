trigger ContactTrigger20Jan on Contact (before insert,before update) {

    Set<Id> setAcc= new Set<Id>();
    for(Contact objCon:trigger.new){
        if(objCon.AccountId !=null){
            setAcc.add(objCon.AccountId);
        }
    }
    
    Map<id,Account> mapAcc =new Map<id,Account>([select id, Name, Rating from Account where id IN:setAcc]);
    
    if(!mapAcc.isEmpty()){
        for(Contact objCon:trigger.new){
            mapAcc.containskey(objCon.AccountId);
                if(mapAcc.get(objCon.AccountId).Rating=='Hot' ){
                    objCon.Level__c='Primary';
                         }else{
                             objCon.Level__c='';
                        }
            }
        }
    
    
}