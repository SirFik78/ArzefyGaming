package Servlet;

import Controller.ItemDAO;
import Model.Item;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ItemServlet1")
public class ItemServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gameId = Integer.parseInt(request.getParameter("gameId"));

        ItemDAO itemDAO = new ItemDAO();
        List<Item> norrItems = itemDAO.getItemsByGameIdAndType(gameId, "Norr");
        List<Item> extraItems = itemDAO.getItemsByGameIdAndType(gameId, "Extra");

        request.setAttribute("norrItems", norrItems);
        request.setAttribute("extraItems", extraItems);

        String gameJspPage = getGameJspPage(gameId);
        request.getRequestDispatcher(gameJspPage).forward(request, response);
    }
        private String getGameJspPage(int gameId) {
        // Anda dapat menyesuaikan logika ini sesuai dengan game yang Anda miliki
        switch (gameId) {
            case 1:
                return "ff.jsp";
            case 2:
                return "genshin.jsp";
            case 3:
                return "hsr.jsp";
            case 4:
                return "hok.jsp";
            case 5:
                return "ml.jsp";
            case 6:
                return "pubg.jsp";
            case 7:
                return "valo.jsp";
            case 8:
                return "wuwa.jsp";
            // Tambahkan case untuk game lainnya sesuai kebutuhan Anda
            default:
                return "index.jsp"; // Halaman default jika tidak ditemukan gameId yang sesuai
        }
    }
}

