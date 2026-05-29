trigger AccountTrigger12Jan on Account (before insert, before update) {

    set<String> setAcc = new Set<String>();
    
    for(Account objAcc:trigger.new){
       setAcc.add(objAcc.Name);
    }
    List<Account> listAcc = [Select Id, Name from Account where Name IN:setAcc];
    
    if(!listAcc.isEmpty()){
        DataBase.delete(listAcc,false);
    }
}