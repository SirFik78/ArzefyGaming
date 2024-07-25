<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.NumberFormat" %>
<%@page import="java.util.Locale" %>
<%@include file="header.jsp" %>
<%@page import="Database.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Riwayat Pemesanan</title>
    <link rel="stylesheet" href="CSS/history.css"/>
</head>
<body>
<CENTER>
    <div class="back">
        <h3>Riwayat Pemesanan</h3>
        <form method="GET" action="SearchHistoryServlet">
            <input type="search" name="query" placeholder="Cari berdasarkan nama game....">
            <input type="submit" value="Cari">
        </form>
        <table border="2" cellpadding="2">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Order Date</th>
                    <th>UID</th>
                    <th>Server</th>
                    <th>Game</th>
                    <th>Item</th>
                    <th>Metode Pembayaran</th>
                    <th>Jumlah</th>
                    <th>Harga</th>
                </tr>
            </thead>
            <tbody>
                <% 
                // Establish connection to your database
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                int totalPrice = 0; // Initialize variable to store total price

                try {
                    // Retrieve connection from your connection pool or create a new one
                    conn = DBConnection.setConnection(); // Replace with your connection method

                    // Get email of logged-in user from session
                    String email = (String) session.getAttribute("eMail"); // Adjust to your session attribute

                    // Prepare base SQL query
                    String sql = "SELECT id_history, Time, email, UID, server, nama_game, nama_item, method_payment, Quantity, price FROM tbl_riwayat WHERE email = ?";

                    // Check if there is a search query
                    String query = request.getParameter("query");
                    if (query != null && !query.isEmpty()) {
                        // Modify SQL query to include search filter by game name
                        sql += " AND nama_game LIKE ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, email);
                        stmt.setString(2, "%" + query + "%");
                    } else {
                        // No search query, execute base query
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, email);
                    }

                    // Execute query
                    rs = stmt.executeQuery();

                    // Create NumberFormat instance for formatting
                    NumberFormat nf = NumberFormat.getInstance(new Locale("in", "ID"));
                    nf.setGroupingUsed(true);
                    nf.setMaximumFractionDigits(0); // No decimal places

                    // Iterate through result set and display rows
                    while (rs.next()) {
                        int price = rs.getInt("price");
                        totalPrice += price; // Accumulate total price
                        %>
                        <tr>
                            <td><%= rs.getInt("id_history") %></td>
                            <td><%= rs.getString("Time") %></td>
                            <td><%= rs.getString("UID") %></td>
                            <td><%= rs.getString("server") %></td>
                            <td><%= rs.getString("nama_game") %></td>
                            <td><%= rs.getString("nama_item") %></td>
                            <td><%= rs.getString("method_payment") %></td>
                            <td><%= rs.getInt("Quantity") %></td>
                            <td>Rp. <%= nf.format(price) %></td>
                        </tr>
                        <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="8" style="text-align:right;"><strong>Total Harga:</strong></td>
                    <td>Rp. <%= NumberFormat.getInstance(new Locale("in", "ID")).format(totalPrice) %></td>
                </tr>
            </tfoot>
        </table>
    </div>
</CENTER>
</body>
</html>
