trigger ApplicantTrigger12Jan on Applicant__c (before insert) {

    set<Decimal> setApp = new Set<Decimal>();
    
    for(Applicant__c objApp:trigger.new){
       setApp.add(objApp.Currency__c);
    }
    
    List<Applicant__c> listApp = [Select Id, Currency__c from Applicant__c where Currency__c IN:setApp];
    
    if(!listApp.isEmpty()){
        DataBase.delete(listApp,false);
    }
    
}