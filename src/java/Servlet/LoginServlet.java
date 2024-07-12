package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    static String sql;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String eMail = request.getParameter("eMail");
        String pWord = request.getParameter("pWord");

        try {
            conn = DBConnection.setConnection();
            sql = "SELECT * FROM tbl_akun WHERE email=? AND password=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, eMail);
            ps.setString(2, pWord);
            
            rs = ps.executeQuery();
            if (rs.next()) {
                boolean status = rs.getBoolean("status");
                if (status) {
                    String username = rs.getString("username");
                    String no_hp = rs.getString("no_hp");

                    HttpSession session = request.getSession();
                    session.setAttribute("user", eMail);
                    session.setAttribute("login", true);
                    session.setAttribute("eMail", eMail);
                    session.setAttribute("username", username);
                    session.setAttribute("no_hp", no_hp);

                    response.sendRedirect("index.jsp"); // Redirect to index.jsp
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("rrorMessage", "Your account is disabled. Please contact support.");
                    response.sendRedirect("signin.jsp");
                }
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Invalid email or password.");
                response.sendRedirect("signin.jsp");
            }
        } catch (IOException | SQLException e) {
            HttpSession session = request.getSession();
            session.setAttribute("rrorMessage", "An error occurred. Please try again.");
            response.sendRedirect("signin.jsp");
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
        return "Short description";
    }
}
