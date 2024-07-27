<%@ page errorPage="error.jsp" %> 
<%@ include file = "connection.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style>
    body {
        background: url('https://images.unsplash.com/photo-1582407947304-fd86f028f716?q=80&w=1992&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    .navbar {
        margin-bottom: 0;
        border-radius: 0;
    }

    #Navbar {
        z-index: 1000;
        position: relative;
    }

    .container {
        position: relative;
        z-index: 1;
        margin-top: 100px;
    }

    .card {
        background-color: white;
        border-radius: 10px;
        border: 1px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        margin-bottom: 30px;
        transition: transform 0.2s;
    }

    .card:hover {
        transform: scale(1.02);
    }

    .card-img-top {
        border-bottom: 1px solid #ddd;
        border-radius: 10px 10px 0 0;
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .card-body {
        padding: 15px;
    }

    .card-title {
        font-size: 1.25em;
        margin-bottom: 10px;
    }

    .card-text {
        margin-bottom: 10px;
    }

    .btn-primary {
        display: block;
        width: 100%;
        border-radius: 20px;
        padding: 10px;
    }

    .marquee {
        background-color: rgba(255, 255, 255, 0.7);
        padding: 30px;
        border-radius: 10px;
        margin-bottom: 30px;
        text-align: center;
    }

    .marquee h2 {
        margin: 0;
        font-size: 3em; /* Increased font size */
        color: #333;
        font-weight: bold;
    }
</style>

</head>
<body>
    <nav id="Navbar">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><i class="glyphicon glyphicon-home"></i> Real-Estate</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="BuyerLR.jsp">Buyer</a></li>
                    <li><a href="AgentLogin.jsp">Agent</a></li>
                    <li><a href="SellerLR.jsp">Seller</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <% if(session.getAttribute("buyerId") != null || session.getAttribute("sellerId") != null || session.getAttribute("employeeId") != null || session.getAttribute("agentId") != null) { %>
                        <li><a href="Logout.jsp">Logout</a></li>
                    <% } %>
                </ul>
            </div>
        </nav>
    </nav>
    <br><br><br>
    <section id="real" class="marquee">
        <marquee>
            <h2>Welcome to Thynk Unlimited Estates</h2>
        </marquee>
    </section>

    <div class="container">
        <div class="row">
            <!-- Card 1 -->
            <div class="col-sm-4">
                <div class="card">
                    <img src="https://wallpapers.com/images/hd/beautiful-house-pictures-gi9u23e95gi8iu2e.jpg" class="card-img-top" alt="House Image">
                    <div class="card-body">
                        <h4 class="card-title">House ID: 1</h4>
                        <p class="card-text">Agent: Aditya Mukund</p>
                        <p class="card-text">City: Visakhapatnam</p>
                        <p class="card-text">Street: Akkayyapalem, Apt No: 23-14A</p>
                        <p class="card-text">Price: 3500000 INR</p>
                        <p class="card-text">Bedrooms: 2</p>
                        <p class="card-text">Sq.ft: 2500</p>
                        <p class="card-text">Specifications: Newly renovated, Sea view</p>
                        <a href="http://localhost:8080/epjsp/BuyerLR.jsp" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <!-- Card 2 -->
            <div class="col-sm-4">
                <div class="card">
                    <img src="https://media.istockphoto.com/id/1436217023/photo/exterior-of-a-blue-suburban-home.jpg?s=612x612&w=0&k=20&c=6n08rcEdza9Vehf5cHzk1uS0UKAN0qr3o884mbDvD5o=" class="card-img-top" alt="House Image">
                    <div class="card-body">
                        <h4 class="card-title">House ID: 2</h4>
                        <p class="card-text">Agent: Satya Pujari</p>
                        <p class="card-text">City: Visakhapatnam</p>
                        <p class="card-text">Street: Devi Nagar, Apt No: 29-12B</p>
                        <p class="card-text">Price: 3500000 INR</p>
                        <p class="card-text">Bedrooms: 3</p>
                        <p class="card-text">Sq.ft: 1327</p>
                        <p class="card-text">Specifications: Newly renovated, Park view</p>
                        <a href="http://localhost:8080/epjsp/BuyerLR.jsp" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <!-- Card 3 -->
            <div class="col-sm-4">
                <div class="card">
                    <img src="https://www.bhg.com/thmb/H9VV9JNnKl-H1faFXnPlQfNprYw=/1799x0/filters:no_upscale():strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg" class="card-img-top" alt="House Image">
                   <div class="card-body">
                        <h4 class="card-title">House ID: 3</h4>
                        <p class="card-text">Agent: Anupam Biswas</p>
                        <p class="card-text">City: Vijayanagaram</p>
                        <p class="card-text">Street: Thotapalem, Apt No: 13-9D</p>
                        <p class="card-text">Price: 3000000 INR</p>
                        <p class="card-text">Bedrooms: 3</p>
                        <p class="card-text">Sq.ft: 2400</p>
                        <p class="card-text">Specifications: Newly renovated, City view</p>
                        <a href="http://localhost:8080/epjsp/BuyerLR.jsp" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <div class="container">
        <div class="row">
            <!-- Card 4 -->
            <div class="col-sm-4">
                <div class="card">
                    <img src="https://wallpapers.com/images/hd/beautiful-house-pictures-gi9u23e95gi8iu2e.jpg" class="card-img-top" alt="House Image">
                    <div class="card-body">
                        <h4 class="card-title">House ID: 4</h4>
                        <p class="card-text">Agent: Raunak Jaiswal</p>
                        <p class="card-text">City: Vijayanagaram</p>
                        <p class="card-text">Street: Dharmapuri, Apt No: 12-13C</p>
                        <p class="card-text">Price: 3200000 INR</p>
                        <p class="card-text">Bedrooms: 2</p>
                        <p class="card-text">Sq.ft: 1200</p>
                        <p class="card-text">Specifications: Newly renovated</p>
                        <a href="http://localhost:8080/epjsp/BuyerLR.jsp" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <!-- Card 5 -->
            <div class="col-sm-4">
                <div class="card">
                    <img src="https://media.istockphoto.com/id/1436217023/photo/exterior-of-a-blue-suburban-home.jpg?s=612x612&w=0&k=20&c=6n08rcEdza9Vehf5cHzk1uS0UKAN0qr3o884mbDvD5o=" class="card-img-top" alt="House Image">
                    <div class="card-body">
                        <h4 class="card-title">House ID: 5</h4>
                        <p class="card-text">Agent: Satyam Kasyap</p>
                        <p class="card-text">City: Anakapalle</p>
                        <p class="card-text">Street: Gandhi, Apt No: 12-16C</p>
                        <p class="card-text">Price: 3500000 INR</p>
                        <p class="card-text">Bedrooms: 3</p>
                        <p class="card-text">Sq.ft: 1327</p>
                        <p class="card-text">Specifications: Newly renovated, Park view</p>
                        <a href="http://localhost:8080/epjsp/BuyerLR.jsp" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
            <!-- Card 6 -->
            <div class="col-sm-4">
                <div class="card">
                    <img src="https://www.bhg.com/thmb/H9VV9JNnKl-H1faFXnPlQfNprYw=/1799x0/filters:no_upscale():strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg" class="card-img-top" alt="House Image">
                   <div class="card-body">
                        <h4 class="card-title">House ID: 6</h4>
                        <p class="card-text">Agent: Anupam Biswas</p>
                        <p class="card-text">City: Vijayanagaram</p>
                        <p class="card-text">Street: Thotapalem, Apt No: 14-19D</p>
                        <p class="card-text">Price: 3000000 INR</p>
                        <p class="card-text">Bedrooms: 3</p>
                        <p class="card-text">Sq.ft: 2400</p>
                        <p class="card-text">Specifications: Newly renovated, City view</p>
                        <a href="http://localhost:8080/epjsp/BuyerLR.jsp" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
