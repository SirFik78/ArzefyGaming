package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Pay;
import Controller.PayDAO;
import java.sql.Timestamp;

@WebServlet(name = "PayServlet", urlPatterns = {"/PayServlet"})
public class PayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("eMail");

        String UID = request.getParameter("UID");
        String server = request.getParameter("server");
        String game = request.getParameter("nama_game");
        String item = request.getParameter("nama_item");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int price = Integer.parseInt(request.getParameter("price"));
        String methodPayment = request.getParameter("method_payment");

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        Pay payment = new Pay(timestamp, email, UID, game, server, item, methodPayment, quantity, price);

        PayDAO payDAO = new PayDAO();
        boolean isInserted = payDAO.insertPayment(payment);

        if (isInserted) {
            // Set attribute to indicate payment success
            request.getSession().setAttribute("paymentSuccess", true);
            response.sendRedirect("index.jsp"); // Redirect to index.jsp
        } else {
            response.getWriter().println("Failed to insert payment record.");
        }
    }
}
