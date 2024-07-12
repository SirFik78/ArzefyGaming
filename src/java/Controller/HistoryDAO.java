package Controller;

import Database.DBConnection;
import Model.History;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HistoryDAO {

    public List<History> getOrderHistoryByEmailAndQuery(String email, String query) {
        List<History> orderHistoryList = new ArrayList<>();
        try (Connection conn = DBConnection.setConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tbl_riwayat WHERE email = ? AND (nama_game LIKE ? OR method_payment LIKE ? OR nama_item LIKE ?)")) {
            stmt.setString(1, email);
            stmt.setString(2, "%" + query + "%");
            stmt.setString(3, "%" + query + "%");
            stmt.setString(4, "%" + query + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                History order = new History();
                order.setId_history(rs.getInt("id_history"));
                order.setTime(rs.getTimestamp("Time"));
                order.setUID(rs.getString("UID"));
                order.setGame(rs.getString("nama_game"));
                order.setItem(rs.getString("nama_item"));
                order.setMethod_payment(rs.getString("method_payment"));
                order.setQuantity(rs.getInt("Quantity")); // Pastikan Quantity sudah ada di tabel
                order.setPrice(rs.getInt("price")); // Pastikan price sudah ada di tabel
                orderHistoryList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderHistoryList;
    }
}
