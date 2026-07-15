public class Computer {

    private String CPU;
    private String RAM;
    private String Storage;

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public void setStorage(String Storage) {
        this.Storage = Storage;
    }

    public void showDetails() {
        System.out.println("CPU: " + CPU);
        System.out.println("RAM: " + RAM);
        System.out.println("Storage: " + Storage);
    }
}