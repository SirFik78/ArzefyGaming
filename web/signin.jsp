<%-- 
    Document   : register
    Created on : Jul 5, 2024, 1:24:14 PM
    Author     : fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.ArzefyDAO" %>
<jsp:useBean id="wb" class="Model.akunmodel"></jsp:useBean>
<jsp:setProperty property="*" name="wb"/>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
    <head>
        <link rel="stylesheet" href="CSS/signin.css"/>
        <script src="JavaScript/signin.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <main>   

        <div class="signup">
            <span>Belum Daftar?</span>
            <button id="login" type="button">Sign up</button>
        </div>

        <div class="login">
            <span>Sudah Punya Akun?</span>
            <button id="login" type="button">Login</button>
        </div>

        <div class="back-layer">
            <form action="LoginServlet" class="login-form active" id="loginForm">
                <h2>Sign In</h2>
                <label for="lemail">Email</label>
                <input type="email" name="eMail" id="lemail" placeholder="Masukkan Email">
                <div id="lemailError" class="error"></div>
                <label for="lpassword">Password</label>
                <input type="password" name="pWord" id="lpassword" placeholder="*****">
                <div id="lpasswordError" class="error"></div>
                <% 
    String rrorMessage = (String) session.getAttribute("rrorMessage");
    if (rrorMessage != null) {
%>
    <div class="error"><%= rrorMessage %></div>
<%
        session.removeAttribute("errorMessage");
    }
%>
                                                   <% 
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                        <div class="error"><%= errorMessage %></div>
                    <% 
                        }
                    %>
                    <% String errorMessage1 = (String) request.getAttribute("errorMessage1"); %>
<% if (errorMessage1 != null) { %>
    <div class="error">
        <%= errorMessage1 %>
    </div>
<% } %>     
<a id="forget" href="forget.jsp"> Forgot Password? </a>
                <button id="login" type="submit">Login</button>
            </form>

            <form action="RegisterServlet" class="signup-form" id="signupForm">
                <h2>Sign Up</h2>
                <label for="name">Username</label>
                <input type="text" id="name" name="username" placeholder="Masukkan Username">
                <div id="nameError" class="error"></div>
                <label for="hp">NO HP</label>
                <input type="number" id="hp" name="no_hp" placeholder="Masukkan No HP">
                <div id="hpError" class="error"></div>
                <label for="semail">Email</label>
                <input type="email" id="semail" name="email" placeholder="Masukkan Email">
                <div id="semailError" class="error"></div>
                <label for="spassword">Password</label>
                <input type="password" id="spassword" name="password" placeholder="*****">
                <div id="spasswordError" class="error"></div>

                <button id="sign" type="submit" onclick="validateSignup()">Sign up</button>
            </form>
        </div>

    </main>
    </body>
</html>
