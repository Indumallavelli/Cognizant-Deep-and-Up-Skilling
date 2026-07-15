public class LaptopBuilder extends ComputerBuilder {

    @Override
    public void buildCPU() {
        computer.setCPU("Intel i5");
    }

    @Override
    public void buildRAM() {
        computer.setRAM("8 GB");
    }

    @Override
    public void buildStorage() {
        computer.setStorage("512 GB SSD");
    }
}