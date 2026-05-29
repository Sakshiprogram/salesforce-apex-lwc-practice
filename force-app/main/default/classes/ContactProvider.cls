public with sharing class ContactProvider {
   @AuraEnabled
   public static List<Contact> searchLatest5Record(){
    try {
        return [select Name, Email from Contact order by CreatedDate DESC LIMIT 5];
    } catch (Exception e) {
        system.debug(e.getMessage());
        return null;
    }
   }
}