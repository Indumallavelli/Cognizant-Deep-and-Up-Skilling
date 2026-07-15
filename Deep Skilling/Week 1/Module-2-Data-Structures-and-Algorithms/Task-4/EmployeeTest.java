public class EmployeeTest {

    public static void main(String[] args) {

        EmployeeManagement manager = new EmployeeManagement();

        manager.addEmployee(new Employee(1, "Indu", "Developer", 50000));
        manager.addEmployee(new Employee(2, "Sai", "Tester", 40000));

        System.out.println("Employees:");
        manager.traverseEmployees();

        System.out.println("\nSearch:");
        System.out.println(manager.searchEmployee(2));

        manager.deleteEmployee(1);

        System.out.println("\nAfter Delete:");
        manager.traverseEmployees();
    }
}