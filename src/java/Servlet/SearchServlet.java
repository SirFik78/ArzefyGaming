package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Database.DBConnection;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String query = request.getParameter("query");
        ArrayList<String> games = searchGames(query);
        
        StringBuilder result = new StringBuilder();
        for (String game : games) {
            if (result.length() > 0) {
                result.append(";");
            }
            result.append(game);
        }
        
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(result.toString());
        out.flush();
    }
    
private ArrayList<String> searchGames(String query) {
    ArrayList<String> games = new ArrayList<>();
    try (Connection conn = DBConnection.setConnection();
         PreparedStatement ps = conn.prepareStatement("SELECT nama_game, image, address FROM tbl_game WHERE nama_game LIKE ?")) {
        
        ps.setString(1, "%" + query + "%");
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String gameData = rs.getString("nama_game") + "," + rs.getString("image") + "," + rs.getString("address");
                games.add(gameData);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return games;
}

}
