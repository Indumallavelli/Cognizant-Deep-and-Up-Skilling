public class SearchTest {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Mouse", "Accessories"),
                new Product(103, "Keyboard", "Accessories"),
                new Product(104, "Monitor", "Electronics")

        };

        System.out.println("Linear Search:");

        System.out.println(Search.linearSearch(products, "Keyboard"));

        System.out.println();

        System.out.println("Binary Search:");

        System.out.println(Search.binarySearch(products, "Monitor"));

    }
}