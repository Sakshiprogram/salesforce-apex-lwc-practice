public class ContactTrigger3FebHandler {

    public  static void afterInsert(List<Contact> conList){
        ContactTrigger3FebHelper.countofContact(conList);
    }
    
    public  static void afterUpdate(List<Contact> conList){
         ContactTrigger3FebHelper.countofContact(conList);
    }
    
    public  static void afterDelete(List<Contact> conList){
         ContactTrigger3FebHelper.countofContact(conList);
    }
    
    public  static void afterUndelete(List<Contact> conList){
         ContactTrigger3FebHelper.countofContact(conList);
    }
    
    
}