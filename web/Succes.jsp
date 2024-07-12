<%-- 
    Document   : Succes
    Created on : Jul 10, 2024, 1:21:57 AM
    Author     : fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/Game.css"/>
    </head>
    <body>
        <div id="success-modal" class="modal">
            <div class="modal-content">
                <span class="Close" onclick="closeSuccessModal()">&times;</span>
                <h2>Pembayaran Berhasil</h2>
                <p>Terima kasih atas pembelian Anda!</p>
                <button type="submit" id="close" class="Close" onclick="closeSuccessModal()">Tutup</button>
            </div>
        </div>
        <script src="JavaScript/game.js"></script>
    </body>
</html>
