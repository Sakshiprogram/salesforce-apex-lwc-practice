trigger AccountTrigger9jan on Account (before update) {

    for(Account objAcc:trigger.new){
        if(objAcc.Rating=='Hot'){
            objAcc.addError('Rating cannot be changed to Hot');
        }
    }
}