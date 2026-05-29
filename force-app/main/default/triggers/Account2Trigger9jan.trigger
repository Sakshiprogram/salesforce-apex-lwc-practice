trigger Account2Trigger9jan on Account (before update) {

    for(Account objAcc:trigger.new){
        if(objAcc.Rating=='Cold' && trigger.oldMap.get(objAcc.Id).Rating=='Warm'){
            objAcc.addError('cant changed warm to cold');
        }
    }
    
}