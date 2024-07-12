<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Game"%>
<%@page import="Controller.GameDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Game Details</title>
    </head>
    <body>
        <%
            int gameId = Integer.parseInt(request.getParameter("id_game"));
            GameDAO gameDAO = new GameDAO();
            Game game = gameDAO.getGameById(gameId);

            if (game != null) {
        %>
            <h1><%= game.getName() %></h1>
            <img src="<%= game.getImage() %>" alt="<%= game.getName() %>" width="200" height="200"/>
        <%
            } else {
        %>
            <h1>Game not found</h1>
        <%
            }
        %>
    </body>
</html>
