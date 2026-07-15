public abstract class ComputerBuilder {

    protected Computer computer = new Computer();

    public abstract void buildCPU();

    public abstract void buildRAM();

    public abstract void buildStorage();

    public Computer getComputer() {
        return computer;
    }
}