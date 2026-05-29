trigger ContactTrigger20Jan2nd on Contact (before insert,before update) {

    Set<Id> setAcc= new Set<Id>();
    for(Contact objCon:trigger.new){
        if(objCon.AccountId !=null){
            setAcc.add(objCon.AccountId);
        }
    }
    
    Map<id,Account> mapAcc =new Map<id,Account>([select id, Name, Phone from Account where id IN:setAcc]);
    
    if(mapAcc.isEmpty()){
        for(Contact objCon:trigger.new){
            if(mapAcc.containskey(objCon.AccountId) && mapAcc.get(objCon.AccountId).Phone!=null){
                objCon.Phone= mapAcc.get(objCon.AccountId).Phone;
            }
               }  
                      
            }
     
    
    
}