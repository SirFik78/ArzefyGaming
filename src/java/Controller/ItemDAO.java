package Controller;

import Database.DBConnection;
import Model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    public List<Item> getItemsByGameIdAndType(int gameId, String type) {
        List<Item> items = new ArrayList<>();
        try (Connection conn = DBConnection.setConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tbl_item WHERE id_game = ? AND item_type = ?")) {
            stmt.setInt(1, gameId);
            stmt.setString(2, type);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Item item = new Item();
                item.setId_item(rs.getInt("id_item"));
                item.setId_game(rs.getInt("id_game"));
                item.setItem_type(rs.getString("item_type"));
                item.setImage(rs.getString("image"));
                item.setNama_item(rs.getString("nama_item"));
                item.setPrice(rs.getInt("price"));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
}
