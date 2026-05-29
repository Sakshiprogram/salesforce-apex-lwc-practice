public class AccountTigger3FebHandler {
    public Static void beforeInsert(List<Account> accList){
        
        AccountTrigger3febHelper.setRatinghot(accList);
        
    }
     public Static void beforeUpdate(List<Account> accList){
         
         AccountTrigger3febHelper.setRatinghot(accList);
        
    }

}