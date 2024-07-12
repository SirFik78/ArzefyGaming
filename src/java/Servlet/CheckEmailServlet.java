package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        Connection conn = null; // Dapatkan koneksi dari kelas koneksi Anda

        try {
            conn = DBConnection.setConnection(); // Panggil method dari kelas koneksi Anda
            String sql = "SELECT * FROM tbl_akun WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Email ditemukan, arahkan ke halaman perubahan kata sandi
                request.setAttribute("email", email);
                request.getRequestDispatcher("forget1.jsp").forward(request, response);
            } else {
                // Email tidak ditemukan, kembali ke halaman sebelumnya dengan pesan error
                request.setAttribute("errorMessage", "Email tidak ditemukan. Silakan coba lagi.");
                request.getRequestDispatcher("forget.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
