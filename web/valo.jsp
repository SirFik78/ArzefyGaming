    <%@page import="java.util.Locale"%>
    <%@ page import="java.text.NumberFormat" %>
    <%@page import="java.util.ArrayList"%>
    <%@page import="Servlet.ItemServlet1"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.util.List" %>
    <%@page import="Model.Item" %>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<%
    List<Item> norrItems = (List<Item>) request.getAttribute("norrItems");
    NumberFormat currencyFormat = NumberFormat.getInstance(new Locale("id", "ID"));
%>
<html>
    <head>
        <link rel="stylesheet" href="CSS/Game.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
            <div class="container">
        <div class="card">
            <div class="image-container">
                <img src="IMG/valorant.webp" alt="Mobile Legends">
            </div>
            <div class="content">
                <h1>Valorant</h1>
                <p>Untuk menemukan Riot ID Anda, buka halaman profil akun dan salin Riot ID+Tag menggunakan tombol yang tersedia disamping Riot ID. (Contoh: Arzeyvy#123)</p>
            </div>
        </div>
        <div class="right-content">
            <div class="step">
                <div class="step-header">
                    <h3><span>1</span> Masukkan RiotID</h3>
                </div>
                <div class="step-body">
                    <input id="riot-id-input" type="text" placeholder="Masukkan Riot ID (Contoh:Arzevy#234)" required>
                </div>
            </div>
            <div class="step">
                <div class="step-header">
                <h3><span>2</span> Pilih Kategori & Item</h3> 
                </div>
                <div class="step-body">
                    <h3>Pilih Valorant Point</h3>
                    <div class="item-grid" id="item-container">
                                <% for (Item item : norrItems) { %>
                                    <div class="item" data-price="<%= item.getPrice() %>" data-server="false">
                                        <img src="<%= item.getImage() %>" alt="">
                                        <div class="item-info">
                                            <p><%= item.getNama_item() %></p>
                                        </div>
                                        <div class="item-price-box">
                                            <p class="price">Rp. <%= item.getPrice() %></p>
                                        </div>
                                    </div>
                                <% } %>
                    </div>
                </div>
            </div>
            <div class="step">
                <div class="step-header">
                    <h3><span>3</span> Jumlah Yang Dipesan</h3>
                </div>
                <div class="step-body">
                    <div class="input-box">
                        <label for="quantity">Masukkan Jumlah:</label>
                        <input type="number" id="quantity" min="1" max="100" value="1" oninput="validateInput()" value="1" placeholder="Masukkan jumlah angka">
                    </div>
                </div>
            </div>
            <div class="payment-methods">
                <div class="step-header">
                    <h3><span>4</span> Payment</h3>
                </div>
                <h2>E-Wallet dan QRIS</h2>
                    <div class="payment-grid selected" id="item-container">
                        <div class="methode">
                            <img  src="IMG/gopay.webp" alt="Gopay">
                            <p id="totalPayment1">0</p>    
                        </div>
                        <div class="methode">
                            <img src="IMG/dana.webp" alt="Dana">
                            <p id="totalPayment2">0</p>   
                        </div>
                        <div class="methode">
                            <img src="IMG/qris.webp" alt="QRiss">
                            <p id="totalPayment3">0</p>  
                        </div>
                        <div class="methode">
                            <img src="IMG/ovo.webp" alt="OVO">
                            <p id="totalPayment4">0</p>  
                        </div>
                    </div>
            </div>
            <div class="footer">
                    <button id="buy-now" onclick="openPopup()">Beli Sekarang</button>
            </div>
        </div>
    </div> 
<form action="PayServlet" method="post">
    <div id="popup-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closePopup()">&times;</span>
            <h2>Detail Pembelian</h2>
            <p>UID: <span id="popup-riot-id"></span></p>
            <input type="hidden" name="UID" id="hidden-UID">
            <p>Server: <span id="popup-server"></span></p>
            <input type="hidden" name="server" id="hidden-server">
            <p>Total Pembelian: <span id="popup-amount">Rp. 0</span></p>
            <p>Metode Pembayaran:</p>
            <div class="payment-method">
                <img id="popup-method-img" src="" alt="" width="100">
                <input type="hidden" name="method_payment" id="hidden-method-payment">
            </div>
            <input type="hidden" name="nama_game" value="Valorant">
            <input type="hidden" name="nama_item" id="hidden-item">
            <input type="hidden" name="quantity" id="hidden-quantity">
            <input type="hidden" name="price" id="hidden-price">
            <p>QR Code:</p>
            <div class="qr-code">
                <img id="popup-qr" src="IMG/WhatsApp Image 2024-06-23 at 07.58.48_bf474999.jpg" alt="QR Code" width="200">
            </div>
            <button  id="konfirmasi" class="Konfirmasi">Konfirmasi</button>
        </div>
    </div>
</form>

    <!-- Success Modal -->

        <script src="JavaScript/noserver.js"></script>
    <%@include file="footer.jsp" %>
    </body>
</html>
