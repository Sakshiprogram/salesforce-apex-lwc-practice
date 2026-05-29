trigger AccountTrigger13jan on Account (before insert,before update, after undelete) {

    Set<String > setAcc =new Set<String>();
        for(Account objAcc:trigger.new){
            if(!String.isBlank(objAcc.Name)){
                setAcc.add(objAcc.Name);
            }
        }
    
    
}