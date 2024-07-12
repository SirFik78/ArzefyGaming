<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/profil.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Profile Page</title>
</head>
<body>
    <div class="profil-container">
        <div class="kepala">
            <img id="prooo" src="IMG/WhatsApp Image 2024-07-10 at 09.07.44_73bc34b2.jpg" alt="Foto Profil" class="profil-pic">
            <label id="namaprofil" style="text-align: center"><p><%= session.getAttribute("username") %></p></label>
        </div>
        <div class="profil-info">
            <p><i class="fa fa-envelope"><%= session.getAttribute("eMail") %></i></p>
            <p><i class="fa fa-phone"><%= session.getAttribute("no_hp") %></i></p>
        </div>
        <div class="feature">
            <a href="orderHistory.jsp" class="btn">Riwayat</a>
            <a id="sign-out" href="#" class="btn" onclick="penPopup()">Sign Out</a>
        </div>
        <div class="btn-container">
            <a id="delete-account" href="#" class="btn" onclick="openDeletePopup()">Delete Account</a>
        </div>
    </div>
</body>
</html>