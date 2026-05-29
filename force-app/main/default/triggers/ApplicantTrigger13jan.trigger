trigger ApplicantTrigger13jan on Applicant__c (before insert, before update, after undelete) {

    Set<Decimal> setApp = new Set<Decimal>();
    for(Applicant__c objApp:trigger.new){
        if(objApp.Currency__c != Null){
            setApp.add(objApp.Currency__c);
        }
    }
    
    Map<Decimal,Applicant__c> mapApp = new Map<Decimal,Applicant__c>();
    for(Applicant__c objApp:[Select Id, Currency__c from Applicant__c where Currency__c IN:setApp]){
        mapApp.put(objApp.Currency__c, objApp);
    }
    
    if(!mapApp.isEmpty()){
        for(Applicant__c objApp:trigger.new){
            if(mapApp.containsKey(objApp.Currency__c))
                objApp.addError(objApp.Currency__c + 'Records is already present in database');
        }
    }
}