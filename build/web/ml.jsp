<%-- 
    Document   : ml
    Created on : Jul 8, 2024, 8:35:32 PM
    Author     : fikri
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Model.Item"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/Game.css"/>
    </head>
    <body>
        <%
    List<Item> norrItems = (List<Item>) request.getAttribute("norrItems");
        List<Item> extraItems = (List<Item>) request.getAttribute("extraItems");
    NumberFormat currencyFormat = NumberFormat.getInstance(new Locale("id", "ID"));
%>
    <div class="container">
        <div class="card">
            <div class="image-container">
                <img src="IMG/mobile-legends.webp" alt="Mobile Legends">
            </div>
            <div class="content">
                <h1>Mobile Legends</h1>
                <p>Untuk mengetahui User ID Anda, Silakan Klik menu profile dibagian kiri atas pada menu utama game. Dan user ID akan terlihat dibagian bawah Nama Karakter Game Anda. Silakan masukkan User ID dan Zone ID Anda untuk menyelesaikan transaksi.Masukkan 12345678 di User ID dan 1234 di Zone ID (Contoh: 12345678(1596))</p>
            </div>
        </div>
        <div class="right-content">
            <div class="step">
                <div class="step-header">
                    <h3><span>1</span> Masukkan ID Mobile Legends</h3>
                </div>
                <div class="step-body">
                    <input id="riot-id-input" type="text" placeholder="Masukkan ID Mobile Legends (Contoh:12345678(1596))" required>
                </div>
            </div>
            <div class="step">
                <div class="step-header">
                <h3><span>2</span> Pilih Kategori & Item</h3> 
                </div>

                <div class="category">
                    <div class="category-item active" data-category="diamonds"><p>Diamonds</p>
                        <img src="IMG/gambar_diamond_ml-removebg-preview.png" width="80%" height="100px" alt="Diamonds">
                    </div>
                    <div class="category-item" data-category="starlight"><p>Starlight</p>
                        <img src="IMG/Starlight_ml_icon2-removebg-preview.png" width="80%" height="100px" alt="StarLight">
                    </div>
                </div>

                <div class="step-body">
                    <h3>Pilih Items</h3>
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
                                            <h3 id="pass">Pilih Battle Pass</h3>
                        <div class="item-grid" id="item-container">

                            <% for (Item item : extraItems) { %>
                                    <div class="battle" data-price="<%= item.getPrice() %>"data-server="false">
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
                <button id="buy-now">Beli Sekarang</button>
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
            <span id="popup-server"></span>
            <input type="hidden" name="server" id="hidden-server">
            <p>Total Pembelian: <span id="popup-amount">Rp. 0</span></p>
            <p>Metode Pembayaran:</p>
            <div class="payment-method">
                <img id="popup-method-img" src="" alt="" width="100">
                <input type="hidden" name="method_payment" id="hidden-method-payment">
            </div>
            <input type="hidden" name="nama_game" value="Mobile Legends">
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
        <script src="JavaScript/noserver.js"></script>
    <%@include file="footer.jsp" %>
    </body>
</html>
