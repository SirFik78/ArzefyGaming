package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String eMail = (String) session.getAttribute("eMail"); // Ambil email dari sesi

        try {
            Connection conn = DBConnection.setConnection();
            String sql = "UPDATE tbl_akun SET status = ? WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setBoolean(1, false); // Mengatur status akun menjadi false (dinonaktifkan)
            stmt.setString(2, eMail);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                session.invalidate(); // Hapus sesi setelah berhasil menghapus akun
                response.sendRedirect("index.jsp"); // Misalnya, arahkan ke halaman utama
            } else {
                // Gagal menghapus akun
                request.setAttribute("errorMessage", "Gagal menghapus akun. Silakan coba lagi.");
                request.getRequestDispatcher("profil.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Terjadi kesalahan dalam penghapusan akun.");
            request.getRequestDispatcher("profil.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Delete Servlet";
    }
}
