public class LibraryTest {

    public static void main(String[] args) {

        Book[] books = {

                new Book(1, "Java", "James Gosling"),
                new Book(2, "Python", "Guido van Rossum"),
                new Book(3, "C Programming", "Dennis Ritchie"),
                new Book(4, "Data Structures", "Mark Allen")

        };

        System.out.println("Linear Search:");
        System.out.println(LibrarySearch.linearSearch(books, "Python"));

        System.out.println();

        System.out.println("Binary Search:");
        System.out.println(LibrarySearch.binarySearch(books, "Java"));

    }
}