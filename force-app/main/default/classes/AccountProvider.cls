public with sharing class AccountProvider {

@AuraEnabled
public static void createNewAccount(Account accData){

 DataBase.insert(accData,false);

}

//for accountDataTableCompo
@AuraEnabled
public static List<Account> searchAccount(Account objAccount){
    return [
        SELECT Name, Rating, SLA__c, CreatedDate
        FROM Account
        WHERE Name = :objAccount.Name
        LIMIT 10
    ];
}

/*
@AuraEnabled
public static Account searchAccount(Account objAccount){

     // Account objAccc= [select Name,Type,Rating,SLA__c,CreatedDate from Account where Name=:objAccount LIMIT 1];
     // return objAccc;  //with String objAccount
    return [select id, Name,Rating,SLA__c,CreatedDate from Account where Name=:objAccount.Name LIMIT 1];
}
*/

@AuraEnabled
public static Account editAccount(Account objAccount){

 DataBase.update(objAccount,false);

return [select Id,Name ,Type, SLA__c from Account where Id=:objAccount.Id LIMIT 1];
}

@AuraEnabled
public static String deleteAccount(Id objAccount){
    
    Account acc =[Select Id from Account where Id =:objAccount LIMIT 1];
    delete acc;
    return 'Deleted Successfully';
   }


   @AuraEnabled
   public static List<Account>  typeAccount(Account objAcc){
    return [select Name,Type,SLA__c,CreatedDate,Rating from Account where Type=:objAcc.Type];
}



 @AuraEnabled
 public static List<Account> searchLatest10Records(){
    try {
        return [select Name, Rating, Type, SLA__c from Account order by CreatedDate DESC LIMIT 10];
    } catch (Exception e) {
        system.debug(e.getMessage());
        return null;
    }
 }

    // @AuraEnabled
    // public static List<Contact> searchContact(Account objAcc){
    //     Id accId = [select Id from Account where Name=:objAcc.Name].Id;
    //     return [select Id, Name, Email from Contact where Account =:accId];
    // }



    //LoadAccRecords
    @AuraEnabled
    public static string getUserName(){
        try {
            String UserName=[select Id, Name from User where Id=:UserInfo.getUserId()].Name;
            return UserName;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   

    @AuraEnabled
    public static List<Account> fetchAllAccount(){
        try {
            return [select Id, Name , CreatedBy.Name from Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}