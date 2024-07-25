<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="Servlet.ItemServlet1" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/header.css"/>
    <link rel="icon" href="IMG/icon.png">
    <title>Arzevy Gaming StoreRev</title>
</head>
<body>
<header>
    <a href="index.jsp?gameId=<%= request.getParameter("gameId") %>" class="logo"><img src="IMG/Rimberio (1).png" alt="" width="200px" height="auto"></a>
    <div class="header-right">
        <a id="home" class="active" href="index.jsp?gameId=<%= request.getParameter("gameId") %>">Home</a>
        <% 
            Boolean isLoggedIn = (session != null) && (session.getAttribute("login") != null) && (Boolean) session.getAttribute("login");
            if (isLoggedIn) { 
                String username = (String) session.getAttribute("username");
        %>
            <a id="orderHistory" href="orderHistory.jsp">Riwayat Pemesanan</a>
            <a id="Profil" href="profil.jsp"><%= username %></a>
        <% 
            } else { 
        %>
            <a id="signIn" href="signin.jsp">Sign In</a>
        <% 
            } 
        %>
    </div>
</header>
<div id="signOutPopup" class="popup">             
    <div class="kartu">
        <center>
            <span class="close" onclick="losePopup()">&times;</span>
            <h2 id="sure">Apakah Kamu Yakin Ingin Sign Out?</h2>
            <form action="SignOutServlet" method="post">
                <button type="submit">Confirm</button>
            </form>
        </center>
    </div>
</div>   

<div id="deleteAccountPopup" class="popup">
    <div class="kartu">
        <center>
            <span class="close" onclick="closePopup()">&times;</span>
            <h2 id="sure">Apakah Kamu Yakin Ingin Hapus Akun?</h2>
            <form action="DeleteServlet" method="post">
                <button type="submit">Confirm</button>
            </form>
        </center>
    </div>
</div>


    
<script type="text/javascript" src="JavaScript/search.js"></script>
</body>
</html>
