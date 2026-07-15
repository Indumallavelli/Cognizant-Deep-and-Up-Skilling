public class SortTest {

    public static void main(String[] args) {

        Order[] orders = {

                new Order(1, "Indu", 6500),
                new Order(2, "Rahul", 2500),
                new Order(3, "Anu", 8500),
                new Order(4, "Sai", 4500)

        };

        Sort.quickSort(orders, 0, orders.length - 1);

        System.out.println("Sorted Orders:");

        for (Order order : orders)
            System.out.println(order);

    }

}