public class AccountTrigger3FebHelper {

    public static void setRatinghot(List<Account> accList){
        for(Account objAcc:accList){
            if(!String.isBlank(objAcc.Type)){
                if(objAcc.Type=='Prospect') {
                    objAcc.Rating='Hot';
                }  
            }
        }
    }
}