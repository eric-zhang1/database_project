import Classes.Menu;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {

    private static final String DATABASE = "Database.db";
    public static Connection conn = null;

    public static Connection initializeDatabase(String path) {
        String url = "jdbc:sqlite:" + path;
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url);
            if (connection != null) {
                DatabaseMetaData metaData = connection.getMetaData();
                System.out.println("Using driver: " + metaData.getDriverName());
                System.out.println("Database connected successfully.");
            } else {
                System.out.println("Null Connection");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("There was a problem connecting to the database.");
        }
        return connection;
    }

    public static void main(String[] args) {
        conn = initializeDatabase(DATABASE);
        Menu menu = new Menu(conn);  // Instantiate the application
        while (true) {
            int choice = menu.getNextOption();  // Get the option wanted from the customer
            if (choice == 19) { // Exit loop
                System.out.println("Exiting program");
                break;
            } else {
                // Run the menu option for the selected choice
                menu.runMenuOption(choice);
            }
        }
    }
}