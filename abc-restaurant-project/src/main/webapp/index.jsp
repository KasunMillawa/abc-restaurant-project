<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">



    <title>ABC Restaurant</title>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/abc-restaurent.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

   <link rel="stylesheet" href="assets/css/lightbox.css">

    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
  <!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                
                    <!-- ***** Logo Start ***** -->
                    <a href="index.jsp" class="logo">
                        <img src="assets/images/abc-logo.jpg">
                    </a>
                    <!-- ***** Logo End ***** -->

                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                        <li class="scroll-to-section"><a href="#about">About</a></li>
                        <li class="scroll-to-section"><a href="#menu">Menu</a></li>
                        <li class="scroll-to-section"><a href="#specials">Offer</a></li> 
                        
                        <li class="scroll-to-section"><a href="#gallery">Gallery</a></li> 
                       
                        
                        <li class="scroll-to-section"><a href="#query">Contact Us</a></li>

						  <!-- Book a Table Button -->
						<li class="scroll-to-section">
   						 <a href="reservation?action=add" class="book-a-table-btn scrollto">Book a Table</a>
		</li>
		
                        <!-- Dynamic User Greeting -->
                        <c:choose>
                            <c:when test="${sessionScope.customer != null}">
                                <li class="scroll-to-section"><a href="#">Welcome, ${sessionScope.customer.name}!</a></li>
                                <li class="scroll-to-section"><a href="customer?action=logout">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="scroll-to-section"><a href="customer?action=login">Login</a></li>
                            </c:otherwise>
                        </c:choose>

                      
   
                    </ul>        
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
  
    <!-- ***** Main Banner Area Start ***** -->
    <div id="top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="left-content">
                        <div class="inner-content">
                            <h4>ABC Restaurant</h4>
                            <h6>THE BEST EXPERIENCE</h6>
                            <div class="main-white-button scroll-to-section">
                               <a href="reservation?action=add">Make A Reservation</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="main-banner header-text">
                        <div class="Modern-Slider">
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/slide-01.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/slide-02.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                          <!-- Item -->
                          <div class="item">
                            <div class="img-fill">
                                <img src="assets/images/slide-03.jpg" alt="">
                            </div>
                          </div>
                          <!-- // Item -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

    <!-- ***** About Area Starts ***** -->
    <section class="section" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-xs-12">
                    <div class="left-text-content">
                        <div class="section-heading">
                            <h6>About Us</h6>
                            <h2>We Leave A Delicious Memory For You</h2>
                        </div>
                        <p>At ABC Restaurant, we believe in more than just food; we believe in creating memorable experiences. Our menu offers a wide range of dishes, from classic favorites to modern creations, carefully crafted by our talented chefs to satisfy every palate. Whether you're here for a family gathering, a casual meal with friends, or a romantic dinner, we aim to make every visit special.

                        </p>
                        <div class="row">
                            <div class="col-4">
                                <img src="assets/images/about-thumb-01.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img src="assets/images/about-thumb-02.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img src="assets/images/about-thumb-03.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- ***** About Area Ends ***** -->
    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ***** Menu Area Starts ***** -->
<section class="section" id="menu">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="section-heading">
                    <h6>Restaurant Menu</h6>
                    <h2>The best foods</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="menu-item-list">
        <div class="row">
            <!-- Dynamically Load Menu Items from Backend -->
            <c:forEach var="product" items="${products}">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class='card card1'>
                        <!-- Display Product Image -->
                        <img src="${product.imagePath}" alt="Product Image" style="width: 100%; height: 200px; object-fit: cover;">
                        <div class="price"><h6>$<c:out value="${product.price}"/></h6></div>
                        <div class='info'>
                            <h1 class='title'><c:out value="${product.name}"/></h1>
                            <p class='description'><c:out value="${product.description}"/></p>
                            <div class="main-text-button">
                                <!-- Link for Making Reservation -->
                                <div class="scroll-to-section">
                                    <a href="reservation?action=add">Make Reservation <i class="fa fa-angle-down"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ***** Menu Area Ends ***** -->



  


<!-- ======= Specials Section ======= -->
<section id="specials" class="specials py-5 bg-light">
  <div class="container" data-aos="fade-up">
    <div class="section-title text-center mb-5">
      <h2 class="display-4 font-weight-bold">Special Offers</h2>
      <p class="lead text-muted">Discover our exclusive offers available only for online orders</p>
    </div>

    <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="100">
      <div class="col-lg-10">
        <div class="row">
          <c:forEach var="offer" items="${offers}">
            <div class="col-md-6 mb-4">
              <div class="card border-0 shadow-sm h-100">
                <img src="${offer.image}" class="card-img-top img-fluid rounded-top" alt="Offer Image">
                <div class="card-body">
                  <h5 class="card-title text-primary">${offer.name}</h5>
                  <p class="card-text text-secondary">- Exclusively Available for Online Orders -</p>
                  <p class="card-text">${offer.description}</p>
                </div>
                <div class="card-footer bg-transparent border-0">
                  <button class="btn btn-outline-primary btn-block">Order Now</button>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- End Specials Section -->


<!-- ======= Gallery Section ======= -->
<section id="gallery" class="book-a-table section">
    <div class="container" data-aos="fade-up">
        <div class="section-title section-heading">
            <h6>Our Gallery</h6>
            <h2> Photos Of Our Restaurant</h2>
        </div>
    </div>

    <div class="container" data-aos="fade-up" data-aos-delay="100">
        <div class="row">
            <c:forEach var="gallery" items="${galleries}">
                <!-- Adjust column classes here -->
                <div class="col-lg-4 col-md-6">
                    <div class="left-text-content">
                        <div class="gallery-item">
                            <a href="${gallery.image}" class="gallery-lightbox" data-gall="gallery-item">
                                <img src="${gallery.image}" alt="Gallery Image" class="img-fluid uniform-img">
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section><!-- End Gallery Section -->

 


<!-- Embedded CSS -->
<style>
    .uniform-img {
        width: 100%;
        height: 400px; /* Increased height for larger images */
        object-fit: cover; /* Ensures the image fills the space without distortion */
    }

    /* Optional: Adjust spacing between images */
    .gallery-item {
        margin-bottom: 20px;
    }

    /* Optional: Responsive height adjustments */
    @media (max-width: 992px) {
        .uniform-img {
            height: 350px;
        }
    }

    @media (max-width: 768px) {
        .uniform-img {
            height: 300px;
        }
    }

    @media (max-width: 576px) {
        .uniform-img {
            height: 200px;
        }
    }
</style>


<!-- Include Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- ======= Events Section ======= -->
<section id="events" class="events py-5">
    <div class="container" data-aos="fade-up">
        <div class="text-center mb-5">
            <h2 class="display-4 font-weight-bold">Our Services</h2>
            <p class="lead text-muted">Explore the range of services we provide to enhance your experience.</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
            <c:forEach var="service" items="${services}">
                <div class="col-md-6 mb-5 d-flex align-items-stretch">
                    <div class="card border-0 shadow-lg h-100">
                        <img src="${service.image}" class="card-img-top rounded" alt="${service.serviceName} Image">
                        <div class="card-body p-4 d-flex flex-column justify-content-between">
                            <h3 class="card-title text-center mb-4 font-weight-bold">${service.serviceName}</h3>
                            <p class="card-text text-muted text-justify">${service.description}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- End Events Section -->

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Additional Styling for the Section -->
<style>
    .card-img-top {
        height: 300px; /* Make the image larger */
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .card:hover .card-img-top {
        transform: scale(1.05);
    }

    .card-body {
        padding: 2rem; /* Add more padding to card body */
    }

    .card-title {
        font-size: 1.75rem;
        color: #333;
    }

    .card-text {
        font-size: 1rem;
        line-height: 1.6;
    }

    .text-muted {
        color: #6c757d !important;
    }
</style>



<!-- ======= Query Section ======= -->
<section id="query" class="book-a-table section">
    <div class="container" data-aos="fade-up">
        <div class="section-title section-heading">
            <h6>Contact</h6>
            <h2>Contact Us</h2>
        </div>
    </div>

    <div class="container" data-aos="fade-up">
        <div class="row">
            <!-- Google Map -->
            <div class="col-lg-12">
                <iframe style="border:0; width: 100%; height: 450px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3957.457093020949!2d80.63297137500012!3d7.3024323927053025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae3676df00217ff%3A0xac59999a6821007e!2sICBT%20Kandy%20Campus!5e0!3m2!1sen!2slk!4v1724156482892!5m2!1sen!2slk" frameborder="0" allowfullscreen></iframe>
            </div>

            <!-- Query Form -->
            <div class="col-lg-8 mt-5 mt-lg-0 query-form-wrapper">
                <div class="left-text-content">
                    <h4 class="form-title">Submit Your Query</h4> <!-- Added Title for the Form -->
                    <form action="query?action=add" method="post" role="form" class="query-form">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                        </div>
                        <div class="form-group mt-3">
                            <textarea class="form-control" name="message" rows="8" placeholder="Message" required></textarea>
                        </div>
                        <div class="my-3">
                            <div class="loading">Loading</div>
                            <div class="error-message"></div>
                            <div class="sent-message">Your message has been sent. Thank you!</div>
                        </div>
                        <div class="text-center"><button type="submit" class="btn-submit">Submit Query</button></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section><!-- End Query Section -->

<!-- Embedded CSS for Query Form -->
<style>
    .query-form-wrapper {
        margin-top: 50px; /* Space between the section title and the form */
    }

    .form-title {
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: bold;
        color: #333;
        text-align: center;
    }

    .query-form .form-control {
        border-radius: 5px;
        padding: 10px 15px;
        border: 1px solid #ddd;
        background: #f9f9f9;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    }

    .query-form .form-control:focus {
        border-color: #ff6b6b;
        background-color: #fff;
        box-shadow: 0 0 8px rgba(255, 107, 107, 0.5);
    }

    .query-form textarea {
        resize: none;
    }

    .btn-submit {
        background-color: #ff6b6b;
        border: none;
        color: white;
        padding: 10px 25px;
        text-transform: uppercase;
        font-size: 14px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn-submit:hover {
        background-color: #ff4949;
    }

    .left-text-content {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .loading, .error-message, .sent-message {
        display: none; /* Hidden until triggered */
    }

    .my-3 {
        margin-top: 15px;
    }
</style>
                                
    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-xs-12">
                    <div class="right-text-content">
                            <ul class="social-icons">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <a href="index.jsp" class="logo">
                        <img src="assets/images/abc-logo.jpg">
                    </a>
                </div>
               
                </div>
            </div>
    </footer>

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>
    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>
  </body>
</html>
