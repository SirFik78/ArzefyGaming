package Controller;

import Database.DBConnection;
import Model.Pay;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PayDAO {
    public boolean insertPayment(Pay payment) {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO tbl_riwayat (Time, email, UID, nama_game, Server, nama_item, method_payment, Quantity, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            conn = DBConnection.setConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setTimestamp(1, payment.getTime());
            stmt.setString(2, payment.getEmail()); // Changed from username to email
            stmt.setString(3, payment.getUID());
            stmt.setString(4, payment.getNama_game());
            stmt.setString(5, payment.getServer());
            stmt.setString(6, payment.getNama_item());
            stmt.setString(7, payment.getMethod_payment());
            stmt.setInt(8, payment.getQuantity());
            stmt.setInt(9, payment.getPrice());
            
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
