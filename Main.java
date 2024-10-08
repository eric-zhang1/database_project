import Classes.Menu;

public class Main {
    public static void main(String[] args) {
        Menu menu = new Menu();  // Instantiate the application
        while (true) {
            int choice = menu.getNextOption();  // Get the option wanted from the customer
            if (choice == 13) { // Exit loop
                System.out.println("Exiting program");
                break;
            } else {
                // Run the menu option for the selected choice
                menu.runMenuOption(choice);
            }
        }
    }
}