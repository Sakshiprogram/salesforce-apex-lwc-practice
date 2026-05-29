trigger OpportunityTriggerAss13Jan on Opportunity (before insert, before update, after undelete) {

    Set<String> setOppName = new Set<String>();
    Set<String> setOppStage = new Set<String>();
    
    for(Opportunity objOpp:trigger.new){
        if(!String.isBlank(objOpp.Name) && !String.isBlank(objOpp.StageName)){
            setOppName.add(objOpp.Name);
            setOppStage.add(objOpp.StageName);
        }
    }
    
    Map <String,Opportunity> mapOppName = new Map<String,Opportunity>();
    Map <String,Opportunity> mapOppStage = new Map<String,Opportunity>();
    
    for(Opportunity ObjOpp: [Select id, Name, StageName from Opportunity where Name IN:setOppName and StageName IN:setOppStage]){
        mapOppName.put(ObjOpp.Name,ObjOpp);
        mapOppStage.put(ObjOpp.StageName,ObjOpp);
         
    }
    
    if(!mapOppName.isEmpty() && !mapOppStage.isEmpty()){
        for(Opportunity ObjOpp:trigger.new){
            if(mapOppName.containsKey(ObjOpp.Name) && mapOppStage.containskey(ObjOpp.StageName)){
                ObjOpp.addError('Name=' + ObjOpp.Name+'Stage=' + ObjOpp.StageName);
            }
        }
}

}