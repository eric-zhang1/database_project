package Classes;

import java.util.Scanner;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 * Main class for the Equipment Rental Application
 * This class handles the menu and operations for managing customers, warehouses,
 * and providing placeholders for equipment-related operations.
 */
public class Menu {

    interface MenuOption {
        public void invoke();
    }

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
        System.out.println("5. Rent Equipment");
        System.out.println("6. Return Equipment");
        System.out.println("7. Schedule Equipment Delivery");
        System.out.println("8. Schedule Equipment Pickup");
        System.out.println("9. Find Rented Equipments By User");
        System.out.println("10. Find Popular Item");
        System.out.println("11. Find Popular Manufacturer");
        System.out.println("12. Find Popular Drone");
        System.out.println("13. Find Item Number From Most Active Member");
        System.out.println("14. Equipment By Type");
        System.out.println("15. Exit");
        System.out.print("Enter your choice: ");

        int choice = 0;
        do {
            // Keep trying to parse the given string into an integer, until the number returned is between 1 and 13
            try {
                choice = Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Please enter a number between 1-15");
                choice = 0;
            }
        } while (!(choice >= 1 && choice <= 15));

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
            if (isInTable("Customer", "User_ID", userId)) { // If customer already exists, ask again
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
        if (!isInTable("Customer", "User_ID", userId)) {
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

        if (!isInTable("Customer", "User_ID", userId)) {
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
    private boolean isInTable(String table, String attrName, String attrVal) {
        String queryString = "SELECT * FROM " + table + " WHERE " + attrName + " = ?;";
        ResultSet rSet;
        PreparedStatement getCustomer;
        try {
            getCustomer = conn.prepareStatement(queryString);
            getCustomer.setString(1, attrVal);
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

    // --- Equipment Management Placeholders ---

    /**
     * Placeholder for renting equipment.
     */
    private void rentEquipment() {
        String queryString = "INSERT INTO Rental(Rental_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Rental_Fee)"
                        + "VALUES (?, ?, ?, ?, ?, ?);";
        String newRentalID = "SELECT Rental_ID FROM Rental ORDER BY Rental_ID DESC LIMIT 1;";
        PreparedStatement rentEquipment, getRentalID;
        ResultSet rentalSet;
        
        System.out.println("Enter User ID of customer to rent equipment: ");
        String userID = scanner.nextLine();
        if (!isInTable("Customer", "User_ID", userID)) {
            System.out.println("User " + userID + " does not exist");
            return;
        }

        System.out.println("Enter Equipment ID of equipment to be rent out: ");
        String equipmentID = scanner.nextLine();
        if (!isInTable("Equipment_Main", "Serial_Number", equipmentID)) {
            System.out.println("Equipment " + equipmentID + " does not exist");
            return;
        }
        
        System.out.println("Enter Date Due (YYYY-MM-DD): ");
        String dueDate = Date.valueOf(scanner.nextLine()).toString();

        String currentDate = Date.valueOf(LocalDate.now()).toString();

        System.out.println("Enter the Rental Fee: ");
        float rentalFee = scanner.nextFloat();
        // Skip empty line
        scanner.nextLine();

        try {
            getRentalID = conn.prepareStatement(newRentalID);
            rentalSet = getRentalID.executeQuery();
            rentalSet.next();
            String rentalID = rentalSet.getString("Rental_ID");

            //Parse the string
            rentalID = incrementRentalID(rentalID);

            rentEquipment = conn.prepareStatement(queryString);
            rentEquipment.setString(1, rentalID);
            rentEquipment.setString(2, userID);
            rentEquipment.setString(3,  equipmentID);
            rentEquipment.setString(4, dueDate);
            rentEquipment.setString(5, currentDate);
            rentEquipment.setFloat(6, rentalFee);
            rentEquipment.executeUpdate();

            rentEquipment.close();
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.toString());
            System.err.println(queryString);
            System.err.println("Error adding new rental by user " + userID);
            System.exit(0);
        }


        System.out.println("Equipment rented by User: " + userID);
    }

    /**
     * 
     */
    private String incrementRentalID(String ID) {
        String numberSequence = ID.substring(2);    // Grabs the 3 number sequence
        int newIDNum = Integer.parseInt(numberSequence) + 1;
        String newID = ID.substring(0, 2) + String.format("%03d", newIDNum);
        System.out.println(newID);
        return newID;
    }

    /**
     * Placeholder for returning equipment.
     */
    private void returnEquipment() {
        String queryString = "UPDATE Rental SET Return_Date = ? WHERE Customer_ID = ? AND Equipment_ID = ?;";
        PreparedStatement returnEquipment;

        String currentDate = Date.valueOf(LocalDate.now()).toString();

        System.out.println("Enter User ID of customer to return equipment: ");
        String userID = scanner.nextLine();
        if (!isInTable("Customer", "User_ID", userID)) {
            System.out.println("User " + userID + " does not exist");
            return;
        }

        System.out.println("Enter Equipment ID of equipment to be returned: ");
        String equipmentID = scanner.nextLine();
        if (!isInTable("Equipment_Main", "Serial_Number", equipmentID)) {
            System.out.println("Equipment " + equipmentID + " does not exist");
            return;
        }

        try {
            returnEquipment = conn.prepareStatement(queryString);
            returnEquipment.setString(1, currentDate);
            returnEquipment.setString(2, userID);
            returnEquipment.setString(3,  equipmentID);
            returnEquipment.executeUpdate();

            returnEquipment.close();
        } catch (SQLException e) {
            System.err.println("Error returning equipment " + equipmentID + " by user " + userID);
            System.exit(0);
        }

        System.out.println("Equipment returned by User: " + userID);
    }

    /**
     * Placeholder for scheduling equipment delivery.
     */
    private void deliverEquipment() {
        String queryString = "UPDATE Rental SET Delivery_Drone_ID = ? WHERE Customer_ID = ? AND Equipment_ID = ?;";
        PreparedStatement deliverEquipment;

        System.out.println("Enter User ID of customer to rent equipment: ");
        String userID = scanner.nextLine();
        if (!isInTable("Customer", "User_ID", userID)) {
            System.out.println("User " + userID + " does not exist");
            return;
        }

        System.out.println("Enter Equipment ID of equipment to be rented: ");
        String equipmentID = scanner.nextLine();
        if (!isInTable("Equipment_Main", "Serial_Number", equipmentID)) {
            System.out.println("Equipment " + equipmentID + " does not exist");
            return;
        }

        System.out.println("Enter Drone ID of drone to deliver equipment: ");
        String droneID = scanner.nextLine();
        if (!isInTable("Drone_Main", "Serial_Number", droneID)) {
            System.out.println("Drone " + droneID + " does not exist");
            return;
        }

        try {
            deliverEquipment = conn.prepareStatement(queryString);
            deliverEquipment.setString(1, droneID);
            deliverEquipment.setString(2,  userID);
            deliverEquipment.setString(3, equipmentID);
            deliverEquipment.executeUpdate();

            deliverEquipment.close();
        } catch (SQLException e) {
            System.err.println("Error delivering equipment " + equipmentID + " by user " + userID);
            System.exit(0);
        }


        System.out.println("Equipment delivery scheduled by User: " + userID);
    }

    /**
     * Placeholder for scheduling equipment pickup.
     */
    private void pickupEquipment() {
        String queryString = "UPDATE Rental SET Pickup_Drone_ID = ? WHERE Customer_ID = ? AND Equipment_ID = ?;";
        PreparedStatement pickupEquipment;

        System.out.println("Enter User ID of customer to return equipment: ");
        String userID = scanner.nextLine();
        if (!isInTable("Customer", "User_ID", userID)) {
            System.out.println("User " + userID + " does not exist");
            return;
        }

        System.out.println("Enter Equipment ID of equipment to be returned: ");
        String equipmentID = scanner.nextLine();
        if (!isInTable("Equipment_Main", "Serial_Number", equipmentID)) {
            System.out.println("Equipment " + equipmentID + " does not exist");
            return;
        }

        System.out.println("Enter Drone ID of drone to pickup equipment: ");
        String droneID = scanner.nextLine();
        if (!isInTable("Drone_Main", "Serial_Number", droneID)) {
            System.out.println("Drone " + droneID + " does not exist");
            return;
        }

        try {
            pickupEquipment = conn.prepareStatement(queryString);
            pickupEquipment.setString(1, droneID);
            pickupEquipment.setString(2,  userID);
            pickupEquipment.setString(3, equipmentID);
            pickupEquipment.executeUpdate();

            pickupEquipment.close();
        } catch (SQLException e) {
            System.err.println("Error picking up equipment " + equipmentID + " by user " + userID);
            System.exit(0);
        }

        System.out.println("Equipment pick up scheduled by User: " + userID);
    }

    // --- Report Placeholders ---

    /**
     * Method to return the number of checkouts by specific user
     */
    private void rentCheckouts() {
        String queryString = "SELECT COUNT(Equipment_ID) FROM Rental GROUP BY Customer_ID HAVING Customer_ID = ?;";
        PreparedStatement rentCheckStatement;
        ResultSet rSet;

        System.out.println("Enter member ID:");
        String userID = scanner.nextLine();

        try {
            /*
            * SELECT COUNT (Equipment_ID)
            * From RENTAL
            * Group By Customer_ID
            * HAVING Customer_ID = ?;
            */
            rentCheckStatement = conn.prepareStatement(queryString);
            rentCheckStatement.setString(1, userID);

            rSet = rentCheckStatement.executeQuery();
            // No rentals in database
            if (!rSet.isBeforeFirst()) {
                System.out.println("There are no rentals in the database");
                return;
            }
            rSet.next();
            String count = rSet.getString(1);
            System.out.println("User " + userID + " has rented a total of " + count + " equipments.");
        } catch (SQLException ex) {
            System.err.println("Error finding total rented equipments from user " + userID);
            System.exit(0);
        }
    }

    /**
     * Placeholder for Popular Item
     */
    private void popularItem() {
        String popularItemString = "SELECT Model, Manufacturer, Year FROM Equipment_Main WHERE Equipment_Main.Serial_Number IN (" +
                                "SELECT Equipment_ID From RENTAL Group By Equipment_ID ORDER BY COUNT(Customer_ID) DESC LIMIT 1);";
        PreparedStatement popularItem;
        ResultSet rSet;

        try {
            // Get the serial number for the rental
            popularItem = conn.prepareStatement(popularItemString);
            rSet = popularItem.executeQuery();
            if (!rSet.isBeforeFirst()) {
                System.out.println("There are no rentals in the database");
                return;
            }
            rSet.next();
            String model = rSet.getString("Model");
            String manufacturer = rSet.getString("Manufacturer");
            String year = rSet.getString("Year");
            System.out.println("The most popular item is the " + year + ", " + model + " from " + manufacturer);
        } catch (SQLException e) {
            System.err.println("Error finding the most popular equipment");
            System.exit(0);
        }
    }

    /**
     * Placeholder for popular manufacturer
     */
    private void popularManufacturer() {
        String popularItemString = "SELECT Manufacturer FROM (Rental AS R JOIN Equipment_Main AS EM ON R.Equipment_ID = EM.Serial_Number)" +
                                    "GROUP BY Manufacturer ORDER BY COUNT(R.Rental_ID) DESC LIMIT 1;";
        PreparedStatement popularItem;
        ResultSet rSet;

        try {
            // Get the serial number for the rental
            popularItem = conn.prepareStatement(popularItemString);
            rSet = popularItem.executeQuery();
            if (!rSet.isBeforeFirst()) {
                System.out.println("There are no rentals in the database");
                return;
            }
            rSet.next();
            String manufacturer = rSet.getString("Manufacturer");
            System.out.println("The most popular manufactuere is " + manufacturer);
        } catch (SQLException e) {
            System.err.println("Error finding the most popular manufacturer");
            System.exit(0);
        }
    }

    /**
     * Placeholder for popular drone
     */
    private void popularDrone() {
        String popularDroneQuery = "SELECT Model, Manufacturer, Year FROM Drone_Main WHERE Drone_Main.Serial_Number IN " +
                        "(SELECT Drone_ID From " +
                        "(SELECT Delivery_Drone_ID AS Drone_ID FROM Rental UNION ALL SELECT Pickup_Drone_ID AS Drone_ID FROM Rental)" +
                        "Group By Drone_ID ORDER BY COUNT(*) DESC LIMIT 1);";
        PreparedStatement popularDrone;
        ResultSet rSet;
        try {
            // Get the serial number for the rental
            popularDrone = conn.prepareStatement(popularDroneQuery);
            rSet = popularDrone.executeQuery();
            if (!rSet.isBeforeFirst()) {
                System.out.println("There are no rentals in the database");
                return;
            }
            rSet.next();
            String model = rSet.getString("Model");
            String manufacturer = rSet.getString("Manufacturer");
            String year = rSet.getString("Year");
            System.out.println("The most popular drone is the " + year + ", " + model + " from " + manufacturer);
        } catch (SQLException e) {
            System.err.println("Error finding the most popular manufacturer");
            System.exit(0);
        }
    }

    /**
     * Placeholder for items checked out
     */
    private void itemsCheckedOut() {
        String itemsCheckedQuery = "SELECT Customer_ID, COUNT (Equipment_ID) as Total_Equipment_Rented " +
                        "From RENTAL Group By Customer_ID ORDER BY Total_Equipment_Rented DESC Limit 1;";
        PreparedStatement itemsChecked;
        ResultSet rSet;

        try {
            itemsChecked = conn.prepareStatement(itemsCheckedQuery);
            rSet = itemsChecked.executeQuery();
            if (!rSet.isBeforeFirst()) {
                System.out.println("Database empty");
            }
            rSet.next();
            String customer = rSet.getString(1);
            String count = rSet.getString(2);
            System.out.println("The member with the most items checkout is user " + customer + " at " + count + " items");
        } catch (SQLException e) {
            System.err.println("Error getting user and checkouts");
            System.exit(0);
        }
    }
    
    /**
     * Placeholder for equipment by type
     */
    private void equipmentByType() {
        String equipByTypeQuery = "SELECT Model, Manufacturer, Year, Serial_Number, Status, Location FROM Equipment_Main WHERE Year > ? ORDER BY Model, Manufacturer, Year;";
        PreparedStatement equipByType;
        ResultSet rSet;
        System.out.println("Enter year of equipment release");
        // Get the year needed to check
        int year = Integer.parseInt(scanner.nextLine());

        try {
            equipByType = conn.prepareStatement(equipByTypeQuery);
            equipByType.setInt(1, year);

            rSet = equipByType.executeQuery();
            if (!rSet.isBeforeFirst()) {
                System.out.println("Equipment Main empty");
            }
            System.out.println("Model,  Manufacturer,  Year,  Serial_Number,  Status,  Location");
            while (rSet.next()) {
                String modl = rSet.getString("Model");
                String manu = rSet.getString("Manufacturer");
                String yr = rSet.getString("Year");
                String snum = rSet.getString("Serial_Number");
                String stats = rSet.getString("Status");
                String loc = rSet.getString("Location");
                System.out.println(modl + ",  " + manu + ",  " + yr + ",  " + snum + ",  " + stats + ",  " + loc);
            }
        } catch (SQLException ex) {
            System.err.println("Error getting equipment table");
            System.exit(0);
        }
    }
}