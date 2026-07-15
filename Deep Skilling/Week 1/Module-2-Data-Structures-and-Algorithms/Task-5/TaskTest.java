public class TaskTest {

    public static void main(String[] args) {

        TaskLinkedList list = new TaskLinkedList();

        list.add(new Task(1, "Coding", "Pending"));
        list.add(new Task(2, "Testing", "Completed"));

        System.out.println("Tasks:");
        list.traverse();

        System.out.println("\nSearch:");
        System.out.println(list.search(2));

        list.delete(1);

        System.out.println("\nAfter Delete:");
        list.traverse();
    }
}