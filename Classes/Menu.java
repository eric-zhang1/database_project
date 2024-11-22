package Classes;

import com.sun.jdi.connect.spi.ClosedConnectionException;
import java.util.HashMap;
import java.util.Scanner;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        String insertCustSQLStmt = "INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status)" + 
                                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement insertCustomer;
        String userId, firstName, lastName, address, phone, email, startDate, status;
        while (true) {
            System.out.print("Enter User ID: ");
            userId = scanner.nextLine();
            if (customerExists(userId)) { // If customer already exists, ask again
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

        try {
            /*
             * INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) 
             * VALUES (?, ?, ?, ?, ?, ?, ?, ?)
             */
            insertCustomer = conn.prepareStatement(insertCustSQLStmt);
            insertCustomer.setString(1, userId);
            insertCustomer.setString(2, firstName);
            insertCustomer.setString(3, lastName);
            insertCustomer.setString(4, address);
            insertCustomer.setString(5, phone);
            insertCustomer.setString(6, email);
            insertCustomer.setString(7, startDate);
            insertCustomer.setString(8, status);
            insertCustomer.executeUpdate();

            insertCustomer.close();
        } catch (SQLException ex) {
            System.err.println("Insert Customer Failed. Error code: " + ex.toString());
            System.exit(0);
        }

        System.out.println("Customer added successfully");
    }

    /**
     * Method for updating a single attribute of customer
     */
    private void updateCustomerAttribute(String query, String userID, String attrVal) throws SQLException {
        /*
         * UPDATE Customer
         * SET <attribute> = ?
         * WHERE User_ID = ?
         */
        PreparedStatement updateCustomer;

        updateCustomer = conn.prepareStatement(query);
        updateCustomer.setString(1, attrVal);
        updateCustomer.setString(2, userID);
        updateCustomer.executeUpdate();

        updateCustomer.close();
    }

    /**
     * Edit an existing customer's information.
     */
    private void editCustomer() {
        String editCustomerAttr;
        String userId, firstName, lastName, address, phone, email, status;
        
        System.out.print("Enter User ID of customer to edit: ");
        userId = scanner.nextLine();
        // Check if the customer exists, if not return.
        if (!customerExists(userId)) {
            System.out.println("Customer with User ID: " + userId + " does not exist.");
            return;
        }

        // Ask for new information
        System.out.print("Enter new First Name (or press Enter to keep current): ");
        firstName = scanner.nextLine();

        System.out.print("Enter new Last Name (or press Enter to keep current): ");
        lastName = scanner.nextLine();

        System.out.print("Enter new Address (or press Enter to keep current): ");
        address = scanner.nextLine();

        System.out.print("Enter new Phone (or press Enter to keep current): ");
        phone = scanner.nextLine();

        System.out.print("Enter new Email (or press Enter to keep current): ");
        email = scanner.nextLine();

        System.out.print("Enter new Status (or press Enter to keep current): ");
        status = scanner.nextLine();

        // Sets autocommit to false to ensure that the commits are only committed together

        try {
            conn.setAutoCommit(false);

            if (!firstName.isEmpty()) {
                editCustomerAttr = "UPDATE Customer SET Fname = ? WHERE User_ID = ?;";
                updateCustomerAttribute(editCustomerAttr, userId, firstName);
            }
            if (!lastName.isEmpty()) {
                editCustomerAttr = "UPDATE Customer SET Lname = ? WHERE User_ID = ?;";
                updateCustomerAttribute(editCustomerAttr, userId, lastName);
            }
            if (!address.isEmpty()) {
                editCustomerAttr = "UPDATE Customer SET Address = ? WHERE User_ID = ?;";
                updateCustomerAttribute(editCustomerAttr, userId, address);
            }
            if (!phone.isEmpty()) {
                editCustomerAttr = "UPDATE Customer SET Phone = ? WHERE User_ID = ?;";
                updateCustomerAttribute(editCustomerAttr, userId, phone);
            }
            if (!email.isEmpty()) {
                editCustomerAttr = "UPDATE Customer SET Email = ? WHERE User_ID = ?;";
                updateCustomerAttribute(editCustomerAttr, userId, email);
            }
            if (!status.isEmpty()) {
                editCustomerAttr = "UPDATE Customer SET Status = ? WHERE User_ID = ?;";
                updateCustomerAttribute(editCustomerAttr, userId, status);
            }
            // Commit all of the above changes to the database
            conn.commit();
            // Reset autocommit to true
            conn.setAutoCommit(true);
        } catch (SQLException ex) {
            if (conn != null) {
                try {
                    System.err.println("Attempting to rollback customer update");
                    conn.rollback();
                    System.err.println("Rollback successful");
                } catch (SQLException ex2) {
                    System.err.println("Unable to rollback");
                    System.exit(0);
                }
            }
            System.err.println("Update Customer Failed. Error code: " + ex.toString());
            System.exit(0);
        }

        System.out.println("Customer information updated successfully.");
    }

    /**
     * Delete a customer from the system.
     */
    private void deleteCustomer() {
        String queryString = "DELETE FROM Customer WHERE User_ID = ?;";
        PreparedStatement deleteCustomer;

        System.out.print("Enter User ID of customer to delete: ");
        String userId = scanner.nextLine();

        if (!customerExists(userId)) {
            // If no customer was found with the provided ID
            System.out.println("Customer not found.");
        }

        try {
            /*
             * DELETE FROM Customer 
             * WHERE User_ID = ?;
             */
            deleteCustomer = conn.prepareStatement(queryString);
            deleteCustomer.setString(1, userId);
            deleteCustomer.executeUpdate();

            deleteCustomer.close();
        } catch (SQLException ex) {
            System.err.println("Delete Customer Failed. Error Message: " + ex.toString());
        }

        System.out.println("Customer deleted successfully.");
    }

    /**
     * Private support fuction to return the customers in the database
     */
    private boolean customerExists(String userID) {
        String queryString = "SELECT * FROM Customer WHERE User_ID = ?;";
        ResultSet rSet;
        PreparedStatement getCustomer;
        try {
            getCustomer = conn.prepareStatement(queryString);
            getCustomer.setString(1, userID);
            rSet = getCustomer.executeQuery();
            // Courtesy of Seifer from https://stackoverflow.com/questions/867194/java-resultset-how-to-check-if-there-are-any-results
            // If the rSet's cursor is not before the first record immidiately upon return, there are no rows in the ResultSet
            return rSet.isBeforeFirst();
        } catch (SQLException e) {
            System.err.println("Error finding customer");
            System.exit(0);
        }
        // Defaults to does not exist
        return false;
    }

    /**
     * Search for a customer by user ID.
     */
    private void searchCustomer() {
        String queryString = "SELECT * FROM Customer WHERE User_ID = ?;";

        System.out.print("Enter User ID of customer to search: ");
        String userID = scanner.nextLine();
        

        ResultSet rSet;
        PreparedStatement getCustomer;
        try {
            getCustomer = conn.prepareStatement(queryString);
            getCustomer.setString(1, userID);
            rSet = getCustomer.executeQuery();
            // Courtesy of Seifer from https://stackoverflow.com/questions/867194/java-resultset-how-to-check-if-there-are-any-results
            // If the rSet's cursor is not before the first record immidiately upon return, there are no rows in the ResultSet
            if (rSet.isBeforeFirst()) {    // Customer exists
                rSet.next();    // Set the first row to be the current row
                assert userID.equals(rSet.getString("User_ID")) : "Returned incorrect customer";

                System.out.println("Customer found: ");
                String Fname = rSet.getString("Fname");
                String Lname = rSet.getString("Lname");
                String Address = rSet.getString("Address");
                String Phone = rSet.getString("Phone");
                String Email = rSet.getString("Email");
                String Start_Date = rSet.getString("Start_Date");
                String Status = rSet.getString("Status");
                System.out.println("Name: " + Fname + " " + Lname);
                System.out.println("Address: " + Address);
                System.out.println("Phone Number: " + Phone);
                System.out.println("Email: " + Email);
                System.out.println("Start Date: " + Start_Date);
                System.out.println("Status" + Status);
            } else {
                System.out.println("Customer with User ID: " + userID + " does not exist.");
            }
        } catch (SQLException e) {
            System.err.println("Error finding customer");
            System.exit(0);
        }
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