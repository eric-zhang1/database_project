package Classes;

public class Warehouse {
	private String warehouseId;
    private String city;
    private String address;
    private String phone;
    private String managerName;
    private int storageCapacity;
    private int droneCapacity;

    public Warehouse(String warehouseId, String city, String address, String phone, String managerName, int storageCapacity, int droneCapacity) {
        this.warehouseId = warehouseId;
        this.city = city;
        this.address = address;
        this.phone = phone;
        this.managerName = managerName;
        this.storageCapacity = storageCapacity;
        this.droneCapacity = droneCapacity;
    }

    // Getters and Setters
    public String getWarehouseId() {
        return warehouseId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public int getStorageCapacity() {
        return storageCapacity;
    }

    public void setStorageCapacity(int storageCapacity) {
        this.storageCapacity = storageCapacity;
    }

    public int getDroneCapacity() {
        return droneCapacity;
    }

    public void setDroneCapacity(int droneCapacity) {
        this.droneCapacity = droneCapacity;
    }

    @Override
    public String toString() {
        return "Warehouse{" +
                "warehouseId='" + warehouseId + '\'' +
                ", city='" + city + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", managerName='" + managerName + '\'' +
                ", storageCapacity=" + storageCapacity +
                ", droneCapacity=" + droneCapacity +
                '}';
    }
}
