public class InventoryTest {

    public static void main(String[] args) {

        InventoryManager manager = new InventoryManager();

        manager.addProduct(new Product(1, "Laptop", 10, 50000));
        manager.addProduct(new Product(2, "Mouse", 50, 500));

        System.out.println("Inventory:");

        manager.displayProducts();

        manager.updateProduct(2, 40, 450);

        System.out.println("\nAfter Update:");

        manager.displayProducts();

        manager.deleteProduct(1);

        System.out.println("\nAfter Delete:");

        manager.displayProducts();

    }
}