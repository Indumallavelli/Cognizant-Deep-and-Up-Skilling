public class StrategyTest {

    public static void main(String[] args) {

        PaymentContext context =
                new PaymentContext(new CreditCardPayment());

        context.executePayment(1500);

        context = new PaymentContext(new PayPalPayment());

        context.executePayment(2500);

    }
}