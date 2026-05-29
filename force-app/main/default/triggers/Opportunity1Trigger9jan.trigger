trigger Opportunity1Trigger9jan on Opportunity (before insert) {

     for(Opportunity objOpp:trigger.new){
        if(objOpp.StageName=='Closed Won' && trigger.oldMap.get(objOpp.Id).StageName=='Closed Lost'){
            objOpp.Description='yahoo' ;
        }
    }
}