trigger ApplicantTrigger on Applicant__c(before insert) {
    for(Applicant__c objApp:trigger.new){
        if(objApp.Gender__c=='Male' && !objApp.First_Name__c.startsWith('Mr.')){
            objApp.First_Name__c='Mr. '+objApp.First_Name__c;
        }
         else{
            if(objApp.Gender__c=='Female' && !objApp.First_Name__c.startsWith('Ms.')){
                      objApp.First_Name__c ='Ms. '+ObjApp.First_Name__c;
                }else{
                    objApp.Gender__c.addError('Transgender is currently not allowed');
                }
    }
}
}