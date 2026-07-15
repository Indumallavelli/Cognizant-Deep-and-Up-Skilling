public class Director {

    private ComputerBuilder builder;

    public Director(ComputerBuilder builder) {
        this.builder = builder;
    }

    public Computer constructComputer() {

        builder.buildCPU();
        builder.buildRAM();
        builder.buildStorage();

        return builder.getComputer();
    }
}