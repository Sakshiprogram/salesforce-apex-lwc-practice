public with sharing class ApplicantProvider {
   /*
    @AuraEnabled
    public static Applicant__c searchApplicant(String objApplicant){
        
       Applicant__c objApp = [Select Name,First_Name__c,Last_Name__c, Gender__c,CreatedDate from Applicant__c where Name =: objApplicant];
        return objApp;
        
    } 
        */

     @AuraEnabled
    public static Applicant__c searchApplicant(String objApplicant){
        
      List<Applicant__c> appList =[select Name, First_Name__c, Last_Name__c, Gender__c, CreatedDate
        FROM Applicant__c where Name=:objApplicant LIMIT 1];

        if(!appList.isEmpty()){
            return appList[0];
        }
        return null;
    }


    @AuraEnabled
    public static List<Address__c> searchAddress(Applicant__c objApp){
        Id appId = [select Id from Applicant__c where Name=:objApp.Name ].Id;
       return [select Id, City__c,Country__c, State__c from Address__c where Applicant__c=:appId];

    }


    @AuraEnabled
    public static void createNewApplicant(Applicant__c objApp){
        try {
            DataBase.insert(objApp,false);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }



@AuraEnabled
public static List<Applicant__c> getApplicants(Date startDate, Date endDate){
    try {
        return [select Name, First_Name__c, Last_Name__c, CreatedDate, CreatedById from 
        Applicant__c where CreatedDate >=:startDate and CreatedDate <=:endDate];
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}


@AuraEnabled
public static List<Applicant__c> searchApplicantByAlpha(String firstName){
    try {
        if(!String.isBlank(firstName)){
         String myFirstName = firstName + '%';
            return [select id, Name, First_Name__c from Applicant__c where
            First_Name__c LIKE :myFirstName] ;
        }
        return new List<Applicant__c>();
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}

@AuraEnabled
public static void deleteAddresses(List<Id> recordIds) {

    if (recordIds == null || recordIds.isEmpty()) {
        throw new AuraHandledException('No records selected');
    }

    List<Address__c> addressList = [
        SELECT Id FROM Address__c WHERE Id IN :recordIds
    ];

    delete addressList;
}
}