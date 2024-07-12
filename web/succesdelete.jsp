<%-- 
    Document   : Success
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
    <div id="success-delete-modal" class="modal" style="display:none;">
        <div class="modal-content">
            <span class="Close" onclick="closeDeleteModal()">&times;</span>
            <h2>Akun Berhasil Dihapus</h2>
            <p>Akun Anda telah berhasil dihapus dari sistem.</p>
            <button type="button" id="close" class="Close" onclick="closeDeleteModal()">Tutup</button>
        </div>
    </div>
    <script src="JavaScript/game.js"></script>
    <script>
                function openDeleteModal() {
            var modal = document.getElementById("success-delete-modal");
            modal.style.display = "block";
        }

        function closeDeleteModal() {
            var modal = document.getElementById("success-delete-modal");
            modal.style.display = "none";
        }
    </script>
</body>
</html>
