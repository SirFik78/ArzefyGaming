<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="CSS/forgot.css">
    </head>
    <body>
        <center>
            <div class="lupa">
                <h3>Masukkan Email</h3>
                <form action="CheckEmailServlet" method="post">
                    <label for="mail">Email</label>
                    <input id="mail" name="email" type="email" placeholder="Masukkan Email..." required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                    <% if (errorMessage != null) { %>
                        <p style="color: red;"><%= errorMessage %></p>
                    <% } %>
                    <button type="submit" id="terima">Confirm</button>
                </form>
            </div>
        </center>
    </body>
</html>
