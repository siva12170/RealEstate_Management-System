<%@ page errorPage="error.jsp" %> 
<%@ page session = "true" %>  
<%@ include file = "connection.jsp" %>
<%
    // for revalidation after logout.
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setHeader("Expires","0");

    String agentId = (String)session.getAttribute("agentId");
    String sellerId = (String)session.getAttribute("sellerId");
    String buyerId = (String)session.getAttribute("buyerId");
    String employeeId = (String)session.getAttribute("employeeId");

    if(agentId != null) {
        response.sendRedirect("AgentHome.jsp");
    } else if(sellerId != null) {
        response.sendRedirect("SellerHome.jsp");
    } else if(buyerId != null) {
        response.sendRedirect("BuyerHome.jsp");
    }
%>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="b.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style>
        body {
            padding-top: 70px;
        }
        .navbar-brand i {
            margin-right: 10px;
        }
        .container h3 {
            margin-bottom: 20px;
        }
        .btn-block {
            margin-bottom: 20px;
        }
        section {
            margin-top: 50px;
        }
        .card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            max-width: 400px;
            margin: 0 auto;
        }
        .card-container {
            display: flex;
            justify-content: flex-start; /* Align left horizontally */
            align-items: center; /* Center vertically */
            height: 65vh; /* Full viewport height */
        }
        .card-wrapper {
            margin-left: 30px; /* Adjust this value as needed to move the card left/right */
        }
        .form-group {
            margin-bottom: 15px; /* Decrease space between form fields */
        }
        .form-control {
            margin-bottom: 10px; /* Decrease space between input fields */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">
                    <i class="glyphicon glyphicon-home"></i> Real-Estate
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="BuyerLR.jsp">Buyer</a></li>
                <li><a href="AgentLogin.jsp">Agent</a></li>
                <li class="active"><a href="SellerLR.jsp">Seller</a></li>
                <!-- <li><a href="EmployeeLogin.jsp">Employee</a></li> -->
                <li><a href="contact.jsp">ContactUs</a></li>
            </ul>
        </div>
    </nav>
    <section id="seller-reg">
        <div class="container">
            <div class="card-container">
                <div class="card-wrapper">
                    <div class="card">
                        <h3 style="color: rgb(67, 68, 74);"><b>SELLER REGISTER</b></h3>
                        <hr>
                        <%
                            if (session.getAttribute("userexists") != null) {
                                out.println("<h5 style=\"color:red;\">" + session.getAttribute("userexists") + "</h5>");
                                session.removeAttribute("userexists");
                            } else if (session.getAttribute("id") != null) {
                                String id = (String) session.getAttribute("id");
                                session.removeAttribute("id");
                                out.println("<h5 style=\"color:green;\">Registration Successful, Your Id : " + id + "</h5>");
                            }
                        %>
                        <form action="ValidateSellerRegister.jsp" method="get">
                            <div class="form-group">
                                <h3 style="color: navy; font-size: 1.9em;"><b>Seller Name:</b></h3>
                                <input autocomplete="off" class="form-control" type="text" name="sellerName" placeholder="Your name.." required="">
                            </div>
                            <div class="form-group">
                                <h3 style="color: navy; font-size: 1.9em;"><b>Seller Contact Number:</b></h3>
                                <input autocomplete="off" class="form-control" type="text" name="sellerContact" pattern="[0-9]{10}" placeholder="10 digit phone number.." required="">
                            </div>
                            <div class="form-group">
                                <h3 style="color: navy; font-size: 1.9em;"><b>Password:</b></h3>
                                <input autocomplete="off" class="form-control" type="password" name="sellerPassword" pattern=".{8,}" placeholder="Eight or more characters password.." required="">
                            </div>
                            <button class="btn btn-success"><span class="fa fa-user-plus"></span> Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
