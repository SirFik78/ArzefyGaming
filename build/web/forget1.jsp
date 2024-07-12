<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Password</title>
        <link rel="stylesheet" href="CSS/forgot.css">
    </head>
    <body>
        <center>
            <div class="lupa">
                <h3>Masukkan Password</h3>
                <form action="UpdatePasswordServlet" method="post">
                    <input type="hidden" name="email" value="${email}">
                    <label for="pass">Password</label>
                    <input id="pass" name="password" type="password" placeholder="**********" required>
                    <label for="pass1">Masukkan Ulang Password</label>
                    <input id="pass1" name="confirmPassword" type="password" placeholder="********" required>
                    <button type="submit" id="terima">Confirm</button>
                </form>
                <c:if test="${not empty errorMessage}">
                    <p style="color: red;">${errorMessage}</p>
                </c:if>
            </div>
        </center>
    </body>
</html>
