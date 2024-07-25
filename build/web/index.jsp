<%-- 
    Document   : index
    Created on : Jul 4, 2024, 4:22:31 PM
    Author     : fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Servlet.ItemServlet1" %>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
    <head>
        <link rel="stylesheet" href="CSS/index.css"/>        

        <script src="https://code.jquery.com/jquery.js"></script>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
            <%@include file="Succes.jsp" %>
            <%@include file="succesdelete.jsp" %>
        <script>
    // Check if paymentSuccess attribute is true and display success modal
    <% if (session.getAttribute("paymentSuccess") != null && (boolean) session.getAttribute("paymentSuccess")) { %>
        openSuccessModal(); // Function to open success modal
        <% session.setAttribute("paymentSuccess", false); // Reset paymentSuccess after displaying modal %>
    <% } %>
           <% if (session.getAttribute("successDelete") != null && (boolean) session.getAttribute("successDelete")) { %>
            openDeleteModal(); // Function to open delete success modal
            <% session.setAttribute("successDelete", false); // Reset successDelete after displaying modal %>
        <% } %>

</script>
    <div class="slideshow-container">
        <!-- Full-width images with number and caption text -->
        <div class="mySlides fade">
          <div class="numbertext">1 / 4</div>
          <a href="ItemServlet1?gameId=6">
          <img src="IMG/1.png" style="width: 100%;" ></a>
          
        </div>
      
        <div class="mySlides fade">
          <div class="numbertext">2 / 4</div>
          <a href="ItemServlet1?gameId=5">
          <img src="IMG/2.png" style="width: 100%;" ></a>
        </div>
      
        <div class="mySlides fade">
          <div class="numbertext">3 / 4</div>
          <a href="ItemServlet1?gameId=4">
          <img src="IMG/3.png" style="width: 100%;" ></a>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">4 / 4</div>
            <a href="ItemServlet1?gameId=7">
            <img src="IMG/4.png" style="width: 100%;" ></a>
        </div>

          
      
        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
      </div>
      <br>
      
      <!-- The dots/circles -->
      <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
      </div>
    </div>
    <section>
    <div class="Container">
        <h2>🔥 Sedang Populer</h2>
        <div id="myUL" class="grid-Container">
            <li class="grid">
                <a href="ItemServlet1?gameId=7">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/valorant.webp" alt="">
                            <h2>Valorant</h2>
                        </div>
                    </div>
                </a>  
            </li>
            <div class="grid">
                <a href="ItemServlet1?gameId=2">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/genshin-impact.webp" alt="">
                            <h2>Genshin Impact</h2>
                        </div>
                    </div>
                </a> 
            </div>
            <div class="grid">
                <a href="ItemServlet1?gameId=5">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/mobile-legends.webp" alt="">
                            <h2>Mobile Legend</h2>
                        </div>
                    </div>
                </a>
            </div>
            <div class="grid">
                <a href="ItemServlet1?gameId=1">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/free-fire.webp" alt="">
                            <h2>Free-Fire</h2>
                        </div>
                    </div>
                </a>
            </div>
            <div class="grid">
                <a href="ItemServlet1?gameId=3">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/honkai-star-rail.webp" alt="">
                            <h2>Honkai Star Rail</h2>
                        </div>
                    </div>
                </a>
            </div>
            <div class="grid">
                <a href="ItemServlet1?gameId=4">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/honor-of-kings.webp" alt="">
                            <h2>Honor of king</h2>
                        </div>
                    </div>
                </a>
            </div>
            <div class="grid">
                <a href="ItemServlet1?gameId=6">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/pubg-mobile.webp" alt="">
                            <h2>PUBG Mobile</h2>
                        </div>
                    </div>
                </a>
            </div>
            <div class="grid">
                <a href="ItemServlet1?gameId=8">
                    <div class="Card">
                        <div class="Animation">
                            <img src="IMG/wuthering-waves.webp" alt="">
                            <h2>Wuthering Waves</h2>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
        
   </section>

            <script type="text/javascript" src="JavaScript/index.js"></script>
    </body>
    <%@include file="footer.jsp" %>
</html>
