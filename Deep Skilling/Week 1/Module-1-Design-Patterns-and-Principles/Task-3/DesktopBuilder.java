public class DesktopBuilder extends ComputerBuilder {

    @Override
    public void buildCPU() {
        computer.setCPU("Intel i7");
    }

    @Override
    public void buildRAM() {
        computer.setRAM("16 GB");
    }

    @Override
    public void buildStorage() {
        computer.setStorage("1 TB HDD");
    }
}