package Controller;

import Database.DBConnection;
import Model.akunmodel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ArzefyDAO {
    static String sql;
    static PreparedStatement ps;
    static Connection conn;
    static ResultSet rs;
    static akunmodel wb;

    // Method to check if a user with the given username or email already exists
    public static boolean doesUserExist(String username, String email) {
        boolean userExists = false;
        try {
            DBConnection db = new DBConnection();
            conn = DBConnection.setConnection();
            sql = "SELECT COUNT(*) FROM tbl_akun WHERE (no_hp = ? OR email = ?) AND status = TRUE";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                userExists = rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        } 
        return userExists;
    }

    public static int simpan(akunmodel wb) {
        int status = 0;
        try {
            DBConnection db = new DBConnection();
            conn = db.setConnection();
            sql = "INSERT INTO tbl_akun (username, no_hp, email, password, status) VALUES (?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, wb.getUsername());
            ps.setString(2, wb.getNo_hp());
            ps.setString(3, wb.getEmail());
            ps.setString(4, wb.getPassword());
            ps.setBoolean(5, true); // Defaulting is_enabled to true for new accounts
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
