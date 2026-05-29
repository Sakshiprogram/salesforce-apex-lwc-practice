public class PolymorphismPaymentDemo {
    public virtual class Payment {
        public virtual void pay(Decimal amount){
            System.debug('Processing generic payment of: ' + amount);
        }
    }
    public class CreditCardPayment extends Payment {
        public override void pay(Decimal amount){
            System.debug('Processing credit card payment of: ' + amount);
        }
    }
    public class PaypalPayment extends Payment {
        public override void pay(Decimal amount){
            System.debug('Processing PayPal payment of: ' + amount);
        }
    }
    public static void runDemo(){
        Payment p1 = new CreditCardPayment();
        p1.pay(500); 
        Payment p2 = new PaypalPayment();
        p2.pay(750); 

        Payment p3 = new Payment();
        p3.pay(300); 
    }
}