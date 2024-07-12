package Model;

import java.text.NumberFormat;
import java.util.Locale;

public class Item {
    private int id_item;
    private int id_game;
    private String item_type;
    private String image;
    private String nama_item;
    private int price;

    public Item() {
    }

    public int getId_item() {
        return id_item;
    }

    public void setId_item(int id_item) {
        this.id_item = id_item;
    }

    public int getId_game() {
        return id_game;
    }

    public void setId_game(int id_game) {
        this.id_game = id_game;
    }

    public String getItem_type() {
        return item_type;
    }

    public void setItem_type(String item_type) {
        this.item_type = item_type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNama_item() {
        return nama_item;
    }

    public void setNama_item(String nama_item) {
        this.nama_item = nama_item;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getFormattedPrice() {
        NumberFormat currencyFormat = NumberFormat.getInstance(new Locale("id", "ID"));
        return currencyFormat.format(price);
    }
}
