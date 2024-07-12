package Model;

import java.sql.Timestamp;

public class Pay {
    private int id_history;
    private Timestamp time;
    private String email; // Changed from username to email
    private String UID;
    private String nama_game;
    private String server;
    private String nama_item;
    private String method_payment;
    private int quantity;
    private int price;

    // Default constructor
    public Pay() {}

    // Constructor with parameters
    public Pay(Timestamp time, String email, String UID, String nama_game, String server, String nama_item, String method_payment, int quantity, int price) {
        this.time = time;
        this.email = email;
        this.UID = UID;
        this.nama_game = nama_game;
        this.server = server;
        this.nama_item = nama_item;
        this.method_payment = method_payment;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and Setters
    public int getId_history() {
        return id_history;
    }

    public void setId_history(int id_history) {
        this.id_history = id_history;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUID() {
        return UID;
    }

    public void setUID(String UID) {
        this.UID = UID;
    }

    public String getNama_game() {
        return nama_game;
    }

    public void setNama_game(String nama_game) {
        this.nama_game = nama_game;
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public String getNama_item() {
        return nama_item;
    }

    public void setNama_item(String nama_item) {
        this.nama_item = nama_item;
    }

    public String getMethod_payment() {
        return method_payment;
    }

    public void setMethod_payment(String method_payment) {
        this.method_payment = method_payment;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
