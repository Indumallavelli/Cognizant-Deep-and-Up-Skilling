public class BuilderTest {

    public static void main(String[] args) {

        ComputerBuilder desktopBuilder = new DesktopBuilder();
        Director director1 = new Director(desktopBuilder);

        Computer desktop = director1.constructComputer();

        System.out.println("Desktop Configuration:");
        desktop.showDetails();

        System.out.println();

        ComputerBuilder laptopBuilder = new LaptopBuilder();
        Director director2 = new Director(laptopBuilder);

        Computer laptop = director2.constructComputer();

        System.out.println("Laptop Configuration:");
        laptop.showDetails();
    }
}