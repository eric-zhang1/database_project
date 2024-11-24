--
-- File generated with SQLiteStudio v3.4.4 on Sun Nov 24 14:26:58 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Customer
CREATE TABLE IF NOT EXISTS Customer(
    User_ID text NOT NULL, Fname text, Lname text, Address text, Phone text, Email text, Start_Date text, Status text, 
    primary key(User_ID)
);
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U001', 'Olivia', 'Bennett', '5828 Knight Dr', '(206) 555-0178', 'olivia.bennett@email.com', '1/15/2020', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U002', 'Ethan', 'Carter', '4567 River Rd', '(512) 555-0325', 'ethan.carter@email.com', '2/20/2021', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U003', 'Mia', 'Rodriguez', '8910 Mountain Ave', '(312) 555-0462', 'mia.rodriguez@email.com', '3/5/2021', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U004', 'Noah', 'Hughes', '2345 Hill Ct', '(720) 555-0789', 'noah.hughes@email.com', '4/12/2022', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U005', 'Ava', 'Price', '6789 Sunset Dr', '(305) 555-0914', 'ava.price@email.com', '1/1/1999', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U006', 'Liam', 'Nguyen', '1357 Beach St', '(212) 555-0146', 'liam.nguyen@email.com', '6/30/2019', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U007', 'Sophia', 'Rivera', '2468 Plaza Way', '(415) 555-0284', 'sophia.rivera@email.com', '7/15/2000', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U008', 'Mason', 'Cooper', '7890 Bridge Ln', '(404) 555-0675', 'mason.cooper@email.com', '8/22/2004', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U009', 'Isabella', 'Flores', '1592 Main Ct', '(617) 555-0187', 'isabella.flores@email.com', '9/10/2018', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U010', 'Lucas', 'Reed', '3571 Market St', '(503) 555-0235', 'lucas.reed@email.com', '10/1/2010', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U011', 'Harper', 'Morgan', '8623 Harbor Dr', '(713) 555-0399', 'harper.morgan@email.com', '11/5/2008', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U012', 'Jackson', 'Kelly', '4680 Valley St', '(215) 555-0112', 'jackson.kelly@email.com', '8/21/1990', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U013', 'Grace', 'Price', '1254 School Ln', '(602) 555-0573', 'grace.price@email.com', '1/28/2024', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U014', 'Alexander', 'Wood', '7891 College Ave', '(214) 555-0491', 'alexander.wood@email.com', '2/15/2023', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U015', 'Ella', 'Torres', '2460 Stadium St', '(615) 555-0358', 'ella.torres@email.com', '3/30/2020', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U016', 'Chloe', 'Patel', '3210 Festival Rd', '(213) 555-0678', 'chloe.patel@email.com', '4/5/2021', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U017', 'Benjamin', 'Kim', '6543 Highway Ct', '(310) 555-0912', 'benjamin.kim@email.com', '5/18/2021', 'Inactive');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U018', 'Amelia', 'Thompson', '9876 Plaza Ave', '(202) 555-0345', 'amelia.thompson@email.com', '6/22/2022', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U019', 'William', 'Lewis', '1358 Arena Ln', '(505) 555-0123', 'william.lewis@email.com', '1/6/2000', 'Active');
INSERT INTO Customer (User_ID, Fname, Lname, Address, Phone, Email, Start_Date, Status) VALUES ('U020', 'Brandon', 'Lewis', '2334 Course Dr', '(433) 555-1234', 'brandon.lewis@email.com', '2/45/2013', 'Inactive');

-- Table: Drone_Main
CREATE TABLE IF NOT EXISTS Drone_Main (Warehouse_ID text, Serial_Number text NOT NULL, Order_Number int, Name text, Model text, Status text, Location text, Manufacturer text, Year int, PRIMARY KEY (Serial_Number));
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W003', 'D001', '', 'Skyhawk 1', 'Falcon X100', 'Active', 'Seattle, WA', 'AeroTech', 2018);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W002', 'D002', '', 'Skyhawk 2', 'Eagle Z200', 'In Maintenance', 'Austin, TX', 'SkyVision', 2021);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W012', 'D003', '', 'Falcon 3', 'Nimbus V300', 'Active', 'Chicago, IL', 'Altitude Tech', 2022);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W005', 'D004', '', 'Falcon 4', 'Storm R600', 'Active', 'Denver, CO', 'Cloud Dynamics', 2023);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W005', 'D005', '', 'Thunderbolt A', 'Blackhawk 4000', 'In Maintenance', 'Miami, FL', 'Falcon Industries', 2024);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W012', 'D006', '', 'Thunderbolt B', 'Scout Pro 500', 'Active', 'New York, NY', 'Vantage Robotics', 2021);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W003', 'D007', '', 'Zephyr 1', 'Falcon X200', 'Active', 'San Francisco, CA', 'AeroTech', 2020);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W020', 'D008', '', 'Zephyr 2', 'Cumulus Q600', 'In Maintenance', 'Atlanta, GA', 'Drone Innovations', 2022);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W018', 'D009', '', 'Horizon 1', 'Explorer R300', 'Active', 'Boston, MA', 'Rover Tech', 2022);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W017', 'D010', '', 'Horizon 2', 'Sentinel A100', 'Active', 'Portland, OR', 'Guardian Drones', 2024);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W001', 'D011', '', 'Swift 1', 'Eagle Z300', 'Active', 'Houston, TX', 'SkyVision', 2022);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W008', 'D012', '', 'Swift 2', 'Storm R500', 'Active', 'Philadelphia, PA', 'Cloud Dynamics', 2021);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W007', 'D013', '', 'Scout 1', 'Falcon X100', 'In Maintenance', 'Phoenix, AZ', 'AeroTech', 2018);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W015', 'D014', '', 'Scout 2', 'Eagle Z200', 'Active', 'Dallas, TX', 'SkyVision', 2021);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W016', 'D015', '', 'Guardian 1', 'Nimbus V300', 'Active', 'Nashville, TN', 'Altitude Tech', 2022);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W016', 'D016', '', 'Guardian 2', 'Storm R600', 'Active', 'Miami, FL', 'Cloud Dynamics', 2023);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W003', 'D017', '', 'Viper 1', 'Blackhawk 4000', 'Active', 'Orlando, FL', 'Falcon Industries', 2024);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W005', 'D018', '', 'Viper 2', 'Scout Pro 500', 'Active', 'Salt Lake City, UT', 'Vantage Robotics', 2021);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W017', 'D019', '', 'Rover 1', 'Falcon X200', 'In Maintenance', 'San Diego, CA', 'AeroTech', 2020);
INSERT INTO Drone_Main (Warehouse_ID, Serial_Number, Order_Number, Name, Model, Status, Location, Manufacturer, Year) VALUES ('W004', 'D020', '', 'Rover 2', 'Cumulus Q600', 'Active', 'Nashville, TN', 'Drone Innovations', 2022);

-- Table: Drone_Type
CREATE TABLE IF NOT EXISTS Drone_Type (Model text NOT NULL, Manufacturer text NOT NULL, Year int NOT NULL, Weight_Capacity int, Distance Autonomy int, Max_Speed int, Warranty_Expiration date);
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Falcon X100', 'AeroTech', 2018, 10, 20, 30, '5/10/2024');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Falcon X200', 'AeroTech', 2020, 12, 25, 35, '7/15/2025');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Eagle Z200', 'SkyVision', 2021, 15, 30, 40, '11/20/2024');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Eagle Z300', 'SkyVision', 2022, 18, 35, 42, '9/30/2025');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Storm R500', 'Cloud Dynamics', 2021, 14, 28, 38, '3/14/2024');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Storm R600', 'Cloud Dynamics', 2023, 16, 32, 45, '12/22/2025');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Nimbus V300', 'Altitude Tech', 2022, 20, 40, 50, '1/15/2026');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Nimbus V400', 'Altitude Tech', 2023, 22, 45, 55, '5/1/2026');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Orion 400', 'SkyMax', 2019, 12, 22, 28, '8/15/2024');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Orion 500', 'SkyMax', 2021, 14, 26, 30, '2/10/2025');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Cumulus Q600', 'Drone Innovations', 2022, 15, 30, 35, '4/20/2025');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Cumulus Q700', 'Drone Innovations', 2023, 17, 34, 37, '6/18/2026');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Scout Pro 500', 'Vantage Robotics', 2021, 10, 25, 33, '10/30/2024');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Scout Pro 600', 'Vantage Robotics', 2023, 12, 27, 36, '3/12/2026');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Sentinel A100', 'Guardian Drones', 2024, 18, 50, 48, '1/25/2027');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Sentinel B200', 'Guardian Drones', 2023, 20, 55, 50, '5/30/2026');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Blackhawk 3000', 'Falcon Industries', 2022, 25, 40, 60, '11/15/2026');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Blackhawk 4000', 'Falcon Industries', 2024, 30, 60, 65, '4/1/2027');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Explorer R200', 'Rover Tech', 2023, 16, 30, 40, '9/5/2026');
INSERT INTO Drone_Type (Model, Manufacturer, Year, Weight_Capacity, Distance, Max_Speed, Warranty_Expiration) VALUES ('Explorer R300', 'Rover Tech', 2022, 18, 35, 42, '12/20/2026');

-- Table: Equipment_Main
CREATE TABLE IF NOT EXISTS Equipment_Main (Warehouse_ID text, Serial_Number text NOT NULL, Shipment_ID text, Order_Number int, Request_ID text, Model text, Year int, Status text, Location text, Manufacturer text, PRIMARY KEY (Serial_Number));
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W001', 'E001', 'S001', 'ON011', '', 'EarthMover 1500', 2018, 'Available', '2940 Some Lane, Jackson, Mississippi', 'HeavyMachinery Inc.');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W002', 'E002', 'S002', 'ON013', 'R004', 'SolarPanel Pro', 2022, 'Under Repair', '4760 Random Street, Meeker, Oklahoma', 'EcoEnergy');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W003', 'E003', 'S001', 'ON001', '', 'ProLift 300', 2019, 'Unavailable', '1224 Unreal Avenue, Little Canyon, Texas', 'LiftTech');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W001', 'E004', 'S001', 'ON020', '', 'EarthMover 1500', 2018, 'Available', '2940 Some Lane, Jackson, Mississippi', 'HeavyMachinery Inc.');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W016', 'E005', 'S002', 'ON013', '', 'SolarPanel Pro', 2022, 'Unavailable', '8623 Cypress Dr, Houston, Texas', 'EcoEnergy');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W017', 'E006', 'S003', 'ON001', '', 'ProLift 300', 2019, 'Available', '4680 Chestnut St, Philadelphia, Pennsylvania', 'LiftTech');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W016', 'E007', 'S004', 'ON020', 'R009', 'EarthMover 1500', 2018, 'Under Repair', '8623 Cypress Dr, Houston, Texas', 'HeavyMachinery Inc.');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W016', 'E008', 'S001', 'ON013', '', 'SolarPanel Pro', 2022, 'Available', '8623 Cypress Dr, Houston, Texas', 'EcoEnergy');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W001', 'E009', 'S001', 'ON001', '', 'ProLift 300', 2019, 'Available', '2940 Some Lane, Jackson, Mississippi', 'LiftTech');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W002', 'E010', 'S003', 'ON020', 'R001', 'EarthMover 1500', 2018, 'Unavailable', '4760 Random Street, Meeker, Oklahoma', 'HeavyMachinery Inc.');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W003', 'E011', 'S002', 'ON020', '', 'EarthMover 1500', 2018, 'Available', '1224 Unreal Avenue, Little Canyon, Texas', 'HeavyMachinery Inc.');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W001', 'E012', 'S005', 'ON013', 'R006', 'SolarPanel Pro', 2022, 'Under Repair', '2940 Some Lane, Jackson, Mississippi', 'EcoEnergy');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W018', 'E013', 'S010', 'ON014', '', 'HydroPump 250', 2021, 'Available', '1254 Fig St, Phoenix, Arizona', 'AquaTech');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W009', 'E014', 'S008', 'ON015', '', 'CargoMaster 700', 2020, 'Unavailable', '2345 Pine Ct, Denver, Colorado', 'FreightSolutions');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W015', 'E015', 'S001', 'ON016', '', 'Precision R100', 2022, 'Available', '3571 Ash St, Portland, Oregon', 'Precision Tools');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W001', 'E016', 'S007', 'ON011', '', 'EarthMover 1500', 2018, 'Available', '2940 Some Lane, Jackson, Mississippi', 'HeavyMachinery Inc.');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W002', 'E017', 'S004', 'ON013', '', 'SolarPanel Pro', 2022, 'Unavailable', '4760 Random Street, Meeker, Oklahoma', 'EcoEnergy');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W003', 'E018', 'S002', 'ON014', '', 'HydroPump 250', 2021, 'Available', '1224 Unreal Avenue, Little Canyon, Texas', 'AquaTech');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W001', 'E019', 'S010', 'ON015', '', 'CargoMaster 700', 2020, 'Available', '2940 Some Lane, Jackson, Mississippi', 'FreightSolutions');
INSERT INTO Equipment_Main (Warehouse_ID, Serial_Number, Shipment_ID, Order_Number, Request_ID, Model, Year, Status, Location, Manufacturer) VALUES ('W020', 'E020', 'S010', 'ON016', '', 'Precision R100', 2022, 'Unavailable', '2460 Cherry St, Nashville, Tennessee', 'Precision Tools');

-- Table: Equipment_Service_Request
CREATE TABLE IF NOT EXISTS Equipment_Service_Request (Customer_ID text, Request_ID text NOT NULL, Equipment_ID text, Description text, Status text, PRIMARY KEY (Request_ID));
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U002', 'R001', 'E001', 'Machine stopped working, could not restart it ', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U003', 'R002', 'E010', 'Machine failed after trying to move heavy load ', 'Requested');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U014', 'R003', 'E003', 'Machine is taking too long to move product', 'In-Progress');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U015', 'R004', 'E007', 'Machine battery is not properly charging ', 'In-Progress');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U016', 'R005', 'E011', 'Equipment is failing under heavy load. Not as effective as advertized ', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U002', 'R006', 'E020', 'Equipment providing inaccurate measurements ', 'In-Progress');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U010', 'R007', 'E019', 'Equipment is jammed and is unable to move product ', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U011', 'R008', 'E013', 'Equipment is not pumping water at an effective rate, it''s too slow', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U001', 'R009', 'E006', 'Machine is not able to lift items above 10 ft. Should be able to do 25 ft', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U002', 'R010', 'E009', 'Machine cable severed after trying to lift heavy pallet ', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U002', 'R011', 'E002', 'Wire snapped from machine.', 'In-Progress');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U009', 'R012', 'E014', 'The machine arrived completely broken', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U009', 'R013', 'E014', 'The machine was still broken after being returned', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U018', 'R014', 'E005', 'The machine was completely broken', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U018', 'R015', 'E020', 'The measurements are completely off', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U014', 'R016', 'E012', 'The machine broke after lifting a heavy object', 'Completed ');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U009', 'R017', 'E014', 'Machine broke again', 'In Progress');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U006', 'R018', 'E017', 'Screws are too rusty and the machine is stuck', 'Requested');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U020', 'R019', 'E003', 'The paint on the machine is chipped and is proventing functionality', 'Requested');
INSERT INTO Equipment_Service_Request (Customer_ID, Request_ID, Equipment_ID, Description, Status) VALUES ('U012', 'R020', 'E020', 'The machine short circuited', 'Completed ');

-- Table: Equipment_Type
CREATE TABLE IF NOT EXISTS Equipment_Type(
    Model text NOT NULL, Year int NOT NULL, Manufacturer text NOT NULL, Description text, Type text, Warranty_Expiration date, Weight int, Dimensions text,
    primary key(Model, Year, Manufacturer)
);
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('ProLift 300', 2019, 'LiftTech', 'Heavy-duty lift system', 'Lifting Equipment', '4/10/2024', 500, '50x50x20');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('EarthMover 1500', 2018, 'HeavyMachinery Inc.', 'Powerful excavator', 'Excavation Equipment', '12/30/2023', 2000, '100x120x40');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('SolarPanel Pro', 2022, 'EcoEnergy', 'Efficient solar panel', 'Renewable Energy', '2/18/2027', 50, '65x40x3');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('HydroPump 250', 2021, 'AquaTech', 'Advanced water pump', 'Pumping Equipment', '11/5/2025', 150, '40x30x15');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('CargoMaster 700', 2020, 'FreightSolutions', 'Heavy-duty cargo transport system', 'Transport Equipment', '3/20/2025', 40, '70x70x15');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('Precision R100', 2022, 'Precision Tools', 'Precision surveying equipment', 'Surveying Equipment', '1/25/2026', 20, '45x30x5');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('GigaRig 5000', 2020, 'MegaMachines', 'Industrial rigging equipment', 'Rigging Equipment', '12/10/2025', 2500, '120x120x50');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('PowerGen 2500', 2022, 'EnergyMax', 'Portable power generator', 'Generating Equipment', '3/2/2027', 100, '60x40x40');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('FlexiScoop 400', 2021, 'ConstrucTech', 'Versatile digging attachment', 'Excavation Equipment', '8/30/2025', 75, '35x25x15');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('ShieldTech 300', 2023, 'Security Solutions', 'Advanced security system', 'Security Equipment', '11/11/2026', 18, '30x30x12');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('SmartFarm 100', 2022, 'AgriTech', 'Automated farming equipment', 'Agricultural Equipment', '6/5/2026', 16, '30x30x10');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('WaveRider 250', 2020, 'MarineTech', 'High-speed watercraft', 'Watercraft', '7/20/2025', 220, '25x10x5');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('DataLogger 500', 2021, 'SensorTech', 'Advanced data logging equipment', 'Data Collection', '9/15/2025', 10, '15x10x8');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('UtilityMover 350', 2023, 'Utility Solutions', 'All-terrain utility vehicle', 'Utility Vehicle', '10/22/2026', 1200, '85x60x50');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('WeatherStation 400', 2022, 'WeatherTech', 'Comprehensive weather monitoring', 'Monitoring Equipment', '4/5/2026', 25, '20x15x10');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('Forklift Pro 500', 2020, 'Forklift Solutions', 'Industrial forklift', 'Material Handling', '11/30/2025', 1500, '90x50x60');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('LoadMaster 600', 2021, 'LoadTech', 'Heavy load management system', 'Load Management', '8/12/2025', 300, '70x40x20');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('Mixer 3000', 2023, 'MixTech', 'High-capacity industrial mixer', 'Mixing Equipment', '7/14/2026', 400, '55x55x30');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('Compressor X100', 2021, 'AirTech', 'High-efficiency air compressor', 'Compression Equipment', '9/9/2025', 100, '30x30x20');
INSERT INTO Equipment_Type (Model, Year, Manufacturer, Description, Type, Warranty_Expiration, Weight, Dimensions) VALUES ('Grader Pro 250', 2022, 'Grading Solutions', 'Precision grading machine', 'Grading Equipment', '5/25/2026', 900, '80x60x30');

-- Table: Purchase_Order
CREATE TABLE IF NOT EXISTS Purchase_Order(
    Order_Number int NOT NULL, Element_Type text, Quantity int, Value float, Estimated_Arrival_Date date, Actual_Arrival_Date date,
    primary key(Order_Number)
);
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON001', 'ProLift 300', 10, 150000.0, '1/10/2024', '1/8/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON002', 'GigaRig 5000', 5, 250000.0, '12/9/2024', '');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON003', 'Eagle Z200', 7, 14000.0, '1/23/2024', '2/23/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON004', 'Eagle Z300', 3, 900.0, '3/8/2024', '3/8/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON005', 'Nimbus V300', 2, 1000.0, '5/29/2024', '5/28/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON006', 'Falcon X200', 20, 20000.0, '6/30/2024', '6/30/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON007', 'Storm R600', 10, 150000.0, '10/26/2024', '10/26/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON008', 'Scout Pro 500', 5, 250000.0, '9/9/2024', '9/11/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON009', 'Blackhawk 4000', 5, 75000.0, '4/20/2024', '4/24/2024');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON010', 'Cumulus Q600', 1, 25000.0, '11/25/2024', '');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON011', 'EarthMover 1500', 6, 13600.0, '1/25/2023', '2/3/2023');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON012', 'Falcon X100', 2, 14000.0, '6/30/2023', '7/2/2023');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON013', 'SolarPanel Pro', 7, 20000.0, '11/24/2023', '11/24/2023');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON014', 'HydroPump 250', 4, 30000.0, '4/30/2022', '6/1/2022');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON015', 'CargoMaster 700', 8, 13000.0, '5/5/2023', '5/15/2023');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON016', 'Precision R100', 2, 15400.0, '10/30/2024', '');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON017', 'Scout Pro 600', 3, 300000.0, '10/1/2024', '');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON018', 'Eagle Z300.1', 5, 9000.0, '6/14/2023', '6/20/2023');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON019', 'Falcon X300', 5, 18000.0, '7/12/2023', '7/20/2023');
INSERT INTO Purchase_Order (Order_Number, Element_Type, Quantity, Value, Estimated_Arrival_Date, Actual_Arrival_Date) VALUES ('ON020', 'EarthMover X1500', 2, 200000.0, '11/15/2024', '');

-- Table: Rating_Review
CREATE TABLE IF NOT EXISTS Rating_Review (Customer_ID text, Review_ID text NOT NULL, Comment text, Rating int, PRIMARY KEY (Review_ID));
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U002', 'RR001', 'The machine broke down multiple times, I''m very dissappointed ', 1);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U018', 'RR002', 'I''m very pleased with how the machine is working', 4);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U014', 'RR003', 'The equipment broke after filing to lift heavy load', 1);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U020', 'RR004', 'The Precision R100 gave perfect measures!', 5);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U005', 'RR005', 'The SmartFarm 100 increased my yield by 200% year over year!', 4);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U018', 'RR006', 'The Precision R100 came broken and I had to request a fix for over a year', 2);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U007', 'RR007', 'The ProLift worked fine. It was quite jiterry though.', 3);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U011', 'RR008', 'The SolarPanel Pro did not exactly work as advertised, took too long to set up', 2);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U011', 'RR009', 'The EarthMover 1500 did exactly as I needed. No issues at all', 4);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U009', 'RR010', 'The CargoMaster came completely broken and I had to request maintanence', 2);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U009', 'RR011', 'Got the Cargomaster back from maintanence and it was still broken', 1);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U009', 'RR012', 'Finally got the CargoMaster working. It worked fine, but it required 3 whole maintenance requests', 3);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U004', 'RR013', 'The ProLift 300 was perfect!', 5);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U006', 'RR014', 'EarthMover was okay. It took longer than advertised to move the earth though.', 3);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U001', 'RR015', 'The equipment worked exactrly as advertised', 4);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U012', 'RR016', 'The Precision R100 did not give me precise measurements. My ruler was better.', 2);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U018', 'RR017', 'The equipment broke', 3);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U005', 'RR018', 'The Earthmover worked exactly as advertised', 4);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U009', 'RR019', 'I called support and they straight up refused to help for a month.', 2);
INSERT INTO Rating_Review (Customer_ID, Review_ID, Comment, Rating) VALUES ('U001', 'RR020', 'My delivery drone broke down so my order came late.', 3);

-- Table: Rental
CREATE TABLE IF NOT EXISTS Rental (Rental_ID text NOT NULL, Delivery_Drone_ID text, Pickup_Drone_ID text, Customer_ID text, Equipment_ID text, Checkout_Date TEXT, Due_Date TEXT, Return_Date TEXT, Rental_Fee float, PRIMARY KEY (Rental_ID));
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE001', 'D016', 'D017', 'U004', 'E003', '2024-01-23', '2024-03-23', '2024-03-22', 49.99);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE002', 'D020', 'D015', 'U002', 'E005', '2024-02-23', '2024-04-23', '2024-04-20', 75.5);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE003', 'D011', 'D002', 'U011', 'E010', '2024-06-17', '2024-08-17', '2024-08-17', 120.25);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE004', 'D019', 'D007', 'U009', 'E014', '2024-08-04', '2024-10-04', '2024-10-01', 89.95);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE005', 'D006', 'D006', 'U005', 'E017', '2024-09-26', '2024-11-26', '', 150.0);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE006', 'D001', 'D004', 'U018', 'E020', '2024-10-26', '2024-12-26', '', 65.75);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE007', 'D003', 'D010', 'U002', 'E005', '2024-11-12', '2024-01-12', '2024-01-12', 80.0);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE008', 'D004', 'D003', 'U012', 'E020', '2024-06-14', '2023-08-14', '2023-08-16', 67.0);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE009', 'D009', 'D010', 'U020', 'E003', '2022-01-10', '2022-03-10', '2022-03-12', 49.99);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE010', 'D013', 'D011', 'U011', 'E004', '2022-04-05', '2022-06-05', '2022-06-07', 67.99);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE011', 'D015', 'D020', 'U002', 'E014', '2022-08-01', '2022-10-01', '2022-10-03', 89.95);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE012', 'D019', 'D006', 'U001', 'E004', '2022-11-15', '2023-01-15', '2023-01-13', 67.99);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE013', 'D003', 'D009', 'U005', 'E008', '2023-02-20', '2023-04-20', '2023-04-22', 100.0);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE014', 'D010', 'D001', 'U011', 'E017', '2023-05-30', '2023-07-30', '2023-08-01', 150.0);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE015', 'D011', 'D020', 'U007', 'E003', '2023-09-25', '2023-11-25', '2023-11-28', 49.99);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE016', 'D004', 'D015', 'U014', 'E012', '2024-01-15', '2024-03-15', '2024-03-17', 142.5);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE017', 'D020', 'D007', 'U002', 'E015', '2024-04-10', '2024-06-10', '2024-06-08', 155.99);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE018', 'D014', 'D002', 'U008', 'E020', '2024-07-04', '2024-09-04', '2024-09-06', 65.75);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE019', 'D005', 'D011', 'U006', 'E017', '2024-10-30', '2024-12-30', '2024-12-28', 150.0);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE020', 'D018', 'D016', 'U018', 'E005', '2024-02-14', '2024-04-14', '2024-04-12', 75.5);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE021', 'D004', 'D017', 'U003', 'E012', '2024-11-24', '2025-01-12', '2024-11-24', 12.09000015258789);
INSERT INTO Rental (Rental_ID, Delivery_Drone_ID, Pickup_Drone_ID, Customer_ID, Equipment_ID, Checkout_Date, Due_Date, Return_Date, Rental_Fee) VALUES ('RE022', 'D006', 'D001', 'U004', 'E015', '2025-02-12', '2024-11-24', '2024-11-24', 15.6899995803833);

-- Table: Requests
CREATE TABLE IF NOT EXISTS Requests (Request_ID text, Request_Date date, Service_Type text);
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R001', '1/4/24', 'Mechanical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R002', '2/12/24', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R003', '3/29/24', 'Cosmetic Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R004', '4/5/24', 'Mechanical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R005', '5/20/24', 'Cosmetic Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R006', '6/18/24', 'Mechanical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R007', '7/16/24', 'Mechanical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R008', '8/15/24', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R009', '9/12/24', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R010', '10/1/24', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R011', '7/13/24', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R012', '6/5/23', 'Mechanical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R013', '7/3/23', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R014', '4/16/23', 'Cosmetic Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R015', '10/3/24', 'Cosmetic Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R016', '12/1/23', 'Mechanical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R017', '5/23/24', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R018', '3/24/23', 'Electrical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R019', '1/23/24', 'Mechanical Maintenance');
INSERT INTO Requests (Request_ID, Request_Date, Service_Type) VALUES ('R020', '5/4/23', 'Mechanical Maintenance');

-- Table: Shipment
CREATE TABLE IF NOT EXISTS Shipment (Warehouse_ID text, Shipment_ID text NOT NULL, Shipment_Date date, Arrival_Date date, Status text, PRIMARY KEY (Shipment_ID));
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W001', 'S001', '1/10/24', '1/12/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W002', 'S002', '1/15/24', '1/20/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W006', 'S003', '2/5/24', '2/8/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W004', 'S004', '2/8/24', '2/15/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W009', 'S005', '2/14/24', '2/16/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W014', 'S006', '3/25/24', '3/27/24', 'Cancelled');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W017', 'S007', '4/1/24', '4/10/24', 'Cancelled');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W007', 'S008', '5/4/24', '5/8/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W010', 'S009', '8/4/24', '8/15/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W012', 'S010', '10/25/24', '10/26/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W003', 'S011', '11/3/24', '12/1/24', 'In Transit');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W010', 'S012', '12/3/24', '1/13/25', 'Requested');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W011', 'S013', '10/26/24', '11/15/24', 'In Transit');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W020', 'S014', '1/12/25', '2/1/25', 'Requested');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W007', 'S015', '3/4/23', '3/19/23', 'Cancelled');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W008', 'S016', '7/5/24', '8/12/24', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W015', 'S017', '12/1/24', '1/1/25', 'Requested');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W005', 'S018', '6/2/23', '6/6/23', 'Delivered');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W020', 'S019', '1/1/20', '1/2/21', 'Cancelled');
INSERT INTO Shipment (Warehouse_ID, Shipment_ID, Shipment_Date, Arrival_Date, Status) VALUES ('W001', 'S020', '1/23/25', '2/1/25', 'Requested');

-- Table: Warehouse
CREATE TABLE IF NOT EXISTS Warehouse(
    Warehouse_ID text NOT NULL, City text, Address text, Phone text, MGR_Name text, Storage_Capacity int, Drone_Capacity int, 
    primary key(Warehouse_ID)
);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W001', 'Jackson, Mississippi', '2940 Some Lane', '(123) 456-7890', 'Jordan Jordan', 1200, 12);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W002', 'Meeker, Oklahoma', '4760 Random Street', '(987) 654-3210', 'Manny Meihr', 3000, 25);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W003', 'Little Canyon, Texas', '1224 Unreal Avenue', '(111) 111-1111', 'Guy Johnson', 66400, 50);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W004', 'Denver, Colorado', '5656 Imaginary Road', '(999) 999-9999', 'Kool Guy', 9999, 24);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W005', 'Manchester, Missouri', '0073 Nowhere Place', '(545) 454-5454', 'Prius Karson', 3550, 70);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W006', 'Seattle, Washington', '1234 Maple St', '(206) 555-0178', 'Alice Johnson', 5000, 30);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W007', 'Austin, Texas', '4567 Cedar Blvd', '(512) 555-0325', 'Mark Thompson', 6200, 25);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W008', 'Chicago, Illinois', '8910 Oak Ave', '(312) 555-0462', 'Emily Garcia', 4500, 20);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W009', 'Denver, Colorado', '2345 Pine Ct', '(720) 555-0789', 'David Smith', 5500, 15);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W010', 'Miami, Florida', '6789 Palm Dr', '(305) 555-0914', 'Laura Wilson', 4800, 40);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W011', 'New York, New York', '1357 Elm St', '(212) 555-0146', 'Brian Lee', 7000, 50);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W012', 'San Francisco, California', '2468 Birch Way', '(415) 555-0284', 'Sarah Martinez', 3900, 10);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W013', 'Atlanta, Georgia', '7890 Magnolia Ln', '(404) 555-0675', 'Kevin Brown', 4100, 35);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W014', 'Boston, Massachusetts', '1592 Willow Ct', '(617) 555-0187', 'Jessica Taylor', 5300, 20);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W015', 'Portland, Oregon', '3571 Ash St', '(503) 555-0235', 'Michael Clark', 4600, 18);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W016', 'Houston, Texas', '8623 Cypress Dr', '(713) 555-0399', 'Karen Allen', 5200, 45);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W017', 'Philadelphia, Pennsylvania', '4680 Chestnut St', '(215) 555-0112', 'Jason Walker', 4900, 30);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W018', 'Phoenix, Arizona', '1254 Fig St', '(602) 555-0573', 'Lisa Adams', 5300, 25);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W019', 'Dallas, Texas', '7891 Hickory Ln', '(214) 555-0491', 'Andrew Turner', 6000, 12);
INSERT INTO Warehouse (Warehouse_ID, City, Address, Phone, MGR_Name, Storage_Capacity, Drone_Capacity) VALUES ('W020', 'Nashville, Tennessee', '2460 Cherry St', '(615) 555-0358', 'Michelle Hall', 5500, 22);

-- Index: Equipment_Type_Index
CREATE INDEX IF NOT EXISTS Equipment_Type_Index ON Equipment_Main (Model, Year, Manufacturer);

-- Index: Rental_Info
CREATE INDEX IF NOT EXISTS Rental_Info ON Rental (Customer_ID, Equipment_ID);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
