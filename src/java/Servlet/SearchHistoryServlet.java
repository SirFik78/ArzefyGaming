package Servlet;

import Controller.HistoryDAO;
import Model.History;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchHistoryServlet", urlPatterns = {"/SearchHistoryServlet"})
public class SearchHistoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Get the search query parameter
        String query = request.getParameter("query");
        
        // Get email of logged-in user from session
        String email = (String) request.getSession().getAttribute("email"); // Adjust to your session attribute name
        
        // Call DAO to get order history based on search query and user email
        HistoryDAO historyDAO = new HistoryDAO();
        List<History> orderHistoryList = historyDAO.getOrderHistoryByEmailAndQuery(email, query);
        
        // Set the retrieved order history list as an attribute to be accessed in JSP
        request.setAttribute("orderHistoryList", orderHistoryList);
        
        // Forward the request to the history.jsp page to display the results
        request.getRequestDispatcher("/orderHistory.jsp").forward(request, response);
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
}
