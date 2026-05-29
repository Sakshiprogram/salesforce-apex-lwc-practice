public class Sakshi {
     public void sakshi(){
       system.debug('constructor of sakshi');
    }
    
    public Integer sum(Integer a, Integer b){
       return a+b;
    }
    public Integer div(Integer a, Integer b){
         if (b != 0) {
            return a / b;
        } else {
            System.debug('Division by zero not allowed!');
            return null;
        }
    }
    
    public void display(){
        system.debug('hiii');
    }
    
}