trigger ApplicantTriggerAss13Jan on Applicant__c (before insert, before update, after undelete) {

Set<String> setAppEmail = new Set<String>();
Set<String> setAppPan = new Set<String>();
Set<Boolean> setAppVerify = new Set<Boolean>();

for(Applicant__c objApp:trigger.new){
    if(!String.isBlank(objApp.Email_id__c) && !String.isBlank(objApp.PAN_Card__c) && objApp.Police_Verification_del__c!=null){
    setAppEmail.add(objApp.Email_id__c);
    setAppPan.add(objApp.PAN_Card__c);
    setAppVerify.add(objApp.Police_Verification_del__c);
    }
}

Map<String, Applicant__c> mapEmail = new Map<String, Applicant__c>();
Map<String, Applicant__c> mapPan = new Map<String, Applicant__c>();
Map<Boolean, Applicant__c> mapVerify = new Map<Boolean, Applicant__C>();

for(Applicant__c objApp:[Select id, Email_id__c, PAN_Card__c, Police_Verification_del__c from Applicant__c where Email_id__c IN:setAppEmail and PAN_Card__c IN:setAppPan and Police_Verification_del__c IN:setAppVerify]){
    mapEmail.put(objApp.Email_id__c, objApp);
    mapPan.put(objApp.PAN_Card__c, objApp);
    mapVerify.put(objApp.Police_Verification_del__c, objApp);
}
if(!mapEmail.isEmpty() && !mapPan.isEmpty() && !mapVerify.isEmpty()){
    for(Applicant__c objApp:trigger.new){
        if(mapEmail.containsKey(objApp.Email_id__c) && mapPan.containsKey(objApp.PAN_Card__c) && mapVerify.containsKey(objApp.Police_Verification_del__c)){
            objApp.addError('Email =' + objApp.Email_id__c + 'PAN Card =' + objApp.PAN_Card__c + 'Police Verification =' + objApp.Police_Verification_del__c + 'Already present in Data Base');
        }
    }
}

}