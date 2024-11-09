package Classes;

import java.util.HashMap;
import java.util.Scanner;
import java.sql.Connection;

/**
 * Main class for the Equipment Rental Application
 * This class handles the menu and operations for managing customers, warehouses,
 * and providing placeholders for equipment-related operations.
 */
public class Menu {

    interface MenuOption {
        public void invoke();
    }

    private final HashMap<String, Customer> customers = new HashMap<>();  // List to store customer records
    private final HashMap<String, Warehouse> warehouses = new HashMap<>();  // List to store warehouse records
    private final Scanner scanner = new Scanner(System.in);  // Scanner to read user input
    public Connection conn = null;

    /*
     * Initialize methodList for ease of calling menu methods
     */
    private final MenuOption[] menuList = new MenuOption[] {
        new MenuOption() {@Override public void invoke() {addCustomer(); } },
        new MenuOption() {@Override public void invoke() {editCustomer(); } },
        new MenuOption() {@Override public void invoke() {deleteCustomer(); } },
        new MenuOption() {@Override public void invoke() {searchCustomer(); } },
        new MenuOption() {@Override public void invoke() {addWarehouse(); } },
        new MenuOption() {@Override public void invoke() {editWarehouse(); } },
        new MenuOption() {@Override public void invoke() {deleteWarehouse(); } },
        new MenuOption() {@Override public void invoke() {searchWarehouse(); } },
        new MenuOption() {@Override public void invoke() {rentEquipment(); } },
        new MenuOption() {@Override public void invoke() {returnEquipment(); } },
        new MenuOption() {@Override public void invoke() {deliverEquipment(); } },
        new MenuOption() {@Override public void invoke() {pickupEquipment(); } },
        new MenuOption() {@Override public void invoke() {rentCheckouts(); } },
        new MenuOption() {@Override public void invoke() {popularItem(); } },
        new MenuOption() {@Override public void invoke() {popularManufacturer(); } },
        new MenuOption() {@Override public void invoke() {popularDrone(); } },
        new MenuOption() {@Override public void invoke() {itemsCheckedOut(); } },
        new MenuOption() {@Override public void invoke() {equipmentByType(); } }
    };

    /*
     * Menu constructor
     * 
     * For now, adds dummy customers and warehouses. In the future, will connect the database to the main menu
     */
    public Menu(Connection conn) {
        this.conn = conn;
    }

    public void runMenuOption(int choice) {
        menuList[choice - 1].invoke();
    }

    /**
     * Displays the menu options and returns user's choices
     */
    public int getNextOption() {
        // Display the menu
        System.out.println("\n--- Main Menu ---");
        System.out.println("1. Add Customer");
        System.out.println("2. Edit Customer");
        System.out.println("3. Delete Customer");
        System.out.println("4. Search Customer");
        System.out.println("5. Add Warehouse");
        System.out.println("6. Edit Warehouse");
        System.out.println("7. Delete Warehouse");
        System.out.println("8. Search Warehouse");
        System.out.println("9. Rent Equipment");
        System.out.println("10. Return Equipment");
        System.out.println("11. Schedule Equipment Delivery");
        System.out.println("12. Schedule Equipment Pickup");
        System.out.println("13. Find Rented Equipments By User");
        System.out.println("14. Find Popular Item");
        System.out.println("15. Find Popular Manufacturer");
        System.out.println("16. Find Popular Drone");
        System.out.println("17. Find Item Number From Most Active Member");
        System.out.println("18. Equipment By Type");
        System.out.println("19. Exit");
        System.out.print("Enter your choice: ");

        int choice = 0;
        do {
            // Keep trying to parse the given string into an integer, until the number returned is between 1 and 13
            try {
                choice = Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Please enter a number between 1-19");
                choice = 0;
            }
        } while (!(choice >= 1 && choice <= 19));

        return choice;
    }

    /**
     * Methods for the menu options
     */

    // --- Customer Management ---

    /**
     * Add a new customer to the system.
     */
    private void addCustomer() {
        String userId, firstName, lastName, address, phone, email, startDate, status;
        while (true) {
            System.out.print("Enter User ID: ");
            userId = scanner.nextLine();
            if (customers.containsKey(userId)) { // If customer already exists, ask again
                System.out.println("Customer already exists. Try again");
            } else {
                break;
            }
        } 

        System.out.print("Enter First Name: ");
        firstName = scanner.nextLine();

        System.out.print("Enter Last Name: ");
        lastName = scanner.nextLine();

        System.out.print("Enter Address: ");
        address = scanner.nextLine();

        System.out.print("Enter Phone: ");
        phone = scanner.nextLine();

        System.out.print("Enter Email: ");
        email = scanner.nextLine();

        System.out.print("Enter Start Date (YYYY-MM-DD): ");
        startDate = scanner.nextLine();

        System.out.print("Enter Status: ");
        status = scanner.nextLine();

        // TODO: Add customer to the list
        System.out.println("Customer added successfully");
    }

    /**
     * Edit an existing customer's information.
     */
    private void editCustomer() {
        String userId, firstName, lastName, address, phone, email, status;
        
        System.out.print("Enter User ID of customer to edit: ");
        userId = scanner.nextLine();
        // TODO: Check if the customer exists. If not, return

        // Ask for new information
        System.out.print("Enter new First Name (or press Enter to keep current): ");
        firstName = scanner.nextLine();
        if (!firstName.isEmpty()) {
            // TODO: Edit field
        }

        System.out.print("Enter new Last Name (or press Enter to keep current): ");
        lastName = scanner.nextLine();
        if (!lastName.isEmpty()) {
            // TODO: Edit field
        }

        System.out.print("Enter new Address (or press Enter to keep current): ");
        address = scanner.nextLine();
        if (!address.isEmpty()) {
            // TODO: Edit field
        }

        System.out.print("Enter new Phone (or press Enter to keep current): ");
        phone = scanner.nextLine();
        if (!phone.isEmpty()) {
            // TODO: Edit field
        }

        System.out.print("Enter new Email (or press Enter to keep current): ");
        email = scanner.nextLine();
        if (!email.isEmpty()) {
            // TODO: Edit field
        }

        System.out.print("Enter new Status (or press Enter to keep current): ");
        status = scanner.nextLine();
        if (!status.isEmpty()) {
            // TODO: Edit field
        }

        System.out.println("Customer information updated successfully.");
    }

    /**
     * Delete a customer from the system.
     */
    private void deleteCustomer() {
        System.out.print("Enter User ID of customer to delete: ");
        String userId = scanner.nextLine();
        // TODO: Implement

        /*
        if ( Customer exists ) {
            System.out.println("Customer deleted successfully.");
        } else {
            // If no customer was found with the provided ID
            System.out.println("Customer not found.");
        }
        */
        // Remove later
        System.out.println("Customer deleted successfully.");
    }

    /**
     * Search for a customer by user ID.
     */
    private void searchCustomer() {
        System.out.print("Enter User ID of customer to search: ");
        String userId = scanner.nextLine();

        // TODO: Implement search
        /* 
        if (//Customer exists) {
            System.out.println("Customer found: " + customer);
        } else {
            // If no customer was found with the provided ID
            System.out.println("Customer not found.");
        }
        */

        // Remove later
        System.out.println("Customer found");
    }

    // --- Warehouse Management ---

    /**
     * Add a new warehouse to the system.
     */
    private void addWarehouse() {
        String warehouseId, city, address, phone, managerName;
        int storageCapacity, droneCapacity;

        while (true) {
            System.out.print("Enter Warehouse ID: ");
            warehouseId = scanner.nextLine();
            if (warehouses.containsKey(warehouseId)) { // If customer already exists, ask again
                System.out.println("Warehouse already exists. Try again");
            } else {
                break;
            }
        } 

        System.out.print("Enter City: ");
        city = scanner.nextLine();

        System.out.print("Enter Address: ");
        address = scanner.nextLine();

        System.out.print("Enter Phone: ");
        phone = scanner.nextLine();

        System.out.print("Enter Manager Name: ");
        managerName = scanner.nextLine();

        System.out.print("Enter Storage Capacity: ");
        storageCapacity = Integer.parseInt(scanner.nextLine());

        System.out.print("Enter Drone Capacity: ");
        droneCapacity = Integer.parseInt(scanner.nextLine());

        Warehouse warehouse = new Warehouse(warehouseId, city, address, phone, managerName, storageCapacity, droneCapacity);
        warehouses.put(warehouseId, warehouse);  // Add warehouse to the list
        System.out.println("Warehouse added successfully: " + warehouse);
    }

    /**
     * Edit an existing warehouse's information.
     */
    private void editWarehouse() {
        String warehouseId, city, address, phone, managerName, storageCapacityString, droneCapacityString;

        System.out.print("Enter Warehouse ID of warehouse to edit: ");
        warehouseId = scanner.nextLine();

        Warehouse warehouse;
        if (warehouses.containsKey(warehouseId)) { // Only add if customer does not already exist
            warehouse = warehouses.get(warehouseId);
        } else {
            System.out.println("Warehouse does not exist.");
            return;
        } 

        // Ask for new information
        System.out.print("Enter new City (or press Enter to keep current): ");
        city = scanner.nextLine();
        if (!city.isEmpty()) {
            warehouse.setCity(city);
        }

        System.out.print("Enter new Address (or press Enter to keep current): ");
        address = scanner.nextLine();
        if (!address.isEmpty()) {
            warehouse.setAddress(address);
        }

        System.out.print("Enter new Phone (or press Enter to keep current): ");
        phone = scanner.nextLine();
        if (!phone.isEmpty()) {
            warehouse.setPhone(phone);
        }

        System.out.print("Enter new Manager Name (or press Enter to keep current): ");
        managerName = scanner.nextLine();
        if (!managerName.isEmpty()) {
            warehouse.setManagerName(managerName);
        }

        System.out.print("Enter new Storage Capacity (or press Enter to keep current): ");
        storageCapacityString = scanner.nextLine();
        if (!storageCapacityString.isEmpty()) {
            warehouse.setStorageCapacity(Integer.parseInt(storageCapacityString));
        }

        System.out.print("Enter new Drone Capacity (or press Enter to keep current): ");
        droneCapacityString = scanner.nextLine();
        if (!droneCapacityString.isEmpty()) {
            warehouse.setDroneCapacity(Integer.parseInt(droneCapacityString));
        }
    }

    /**
     * Delete a warehouse from the system.
     */
    private void deleteWarehouse() {
        System.out.print("Enter Warehouse ID of warehouse to delete: ");
        String warehouseId = scanner.nextLine();

        if (warehouses.remove(warehouseId) != null) {
            System.out.println("Warehouse deleted successfully.");
        } else {
            // If no customer was found with the provided ID
            System.out.println("Warehouse not found.");
        }
    }

    /**
     * Search for a warehouse by ID.
     */
    private void searchWarehouse() {
        System.out.print("Enter Warehouse ID of warehouse to search: ");
        String warehouseId = scanner.nextLine();

        Warehouse warehouse = warehouses.get(warehouseId);
        if (warehouse != null) {
            System.out.println("Warehouse found: " + warehouse);
        } else {
            // If no customer was found with the provided ID
            System.out.println("Warehouse not found.");
        }
    }

    // --- Equipment Management Placeholders ---

    /**
     * Placeholder for renting equipment.
     */
    private void rentEquipment() {
        // In future checkpoints, implement the equipment rental process here
        System.out.print("Enter User ID of customer to rent equipment: ");
        String userId = scanner.nextLine();
        /*
        if (customer == null) {
            System.out.println("Customer not found.");
            return;
        }
        */

        System.out.println("Equipment rented by User: " + userId);
    }

    /**
     * Placeholder for returning equipment.
     */
    private void returnEquipment() {
        // In future checkpoints, implement the equipment return process here
        System.out.print("Enter User ID of customer to return equipment: ");
        String userId = scanner.nextLine();
        /*
        if (customer == null) {
            System.out.println("Customer not found.");
            return;
        }
        */

        System.out.println("Equipment returned by User: " + userId);
    }

    /**
     * Placeholder for scheduling equipment delivery.
     */
    private void deliverEquipment() {
        // In future checkpoints, implement the equipment delivery process here
        System.out.print("Enter User ID of customer to deliver equipment: ");
        String userId = scanner.nextLine();
        /*
        if (customer == null) {
            System.out.println("Customer not found.");
            return;
        }
        */

        System.out.println("Equipment delivery scheduled by User: " + userId);
    }

    /**
     * Placeholder for scheduling equipment pickup.
     */
    private void pickupEquipment() {
        // In future checkpoints, implement the equipment pickup process here
        System.out.print("Enter User ID of customer to pickup equipment: ");
        String userId = scanner.nextLine();
        /*
        if (customer == null) {
            System.out.println("Customer not found.");
            return;
        }
        */

        System.out.println("Equipment pickup scheduled by User: " + userId);
    }

    // --- Report Placeholders ---

    /**
     * Placeholder for renting checkouts
     */
    private void rentCheckouts() {
        System.out.println("Enter member ID:");
        String userID = scanner.nextLine();

        System.out.println("Returning number of equipments rented by " + userID);
    }

    /**
     * Placeholder for Popular Item
     */
    private void popularItem() {
        System.out.println("The most popular item is [something]");
    }

    /**
     * Placeholder for popular manufacturer
     */
    private void popularManufacturer() {
        System.out.println("The most popular manufacturer is [someone]");
    }

    /**
     * Placeholder for popular drone
     */
    private void popularDrone() {
        System.out.println("The most popular drone is [drone]");
    }

    /**
     * Placeholder for items checked out
     */
    private void itemsCheckedOut() {
        System.out.println("The member with the most items checkout is [someone] at [#] items");
    }
    
    /**
     * Placeholder for equipment by type
     */
    private void equipmentByType() {
        System.out.println("Here is the description of the equipment by type released before YEAR");
    }
}