package Servlet;

import Controller.ArzefyDAO;
import Model.akunmodel;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the request character encoding
        request.setCharacterEncoding("UTF-8");

        // Get form parameters
        String username = request.getParameter("username");
        String no_hp = request.getParameter("no_hp");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if the user already exists
        boolean userExists = ArzefyDAO.doesUserExist(username, email);

        if (userExists) {
            // If the user already exists, forward to the registration page with an error message
            request.setAttribute("errorMessage", "Username or email already exists.");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        } else {
            // Create a new akunmodel object
            akunmodel newUser = new akunmodel();
            newUser.setUsername(username);
            newUser.setNo_hp(no_hp);
            newUser.setEmail(email);
            newUser.setPassword(password);

            // Save the new user to the database
            int status = ArzefyDAO.simpan(newUser);
            if (status > 0) {
                // Redirect to a success page
                response.sendRedirect("signin.jsp");
            }

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
