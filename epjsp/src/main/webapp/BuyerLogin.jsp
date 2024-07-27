<%@ page errorPage="error.jsp" %> 
<%@ page session = "true" %>  
<%@ page import="java.sql.*" %>
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
    } else if(employeeId != null) {
        response.sendRedirect("EmployeeHome.jsp");
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
            text-align: center;
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
        }
        .card-container {
            display: flex;
            align-items: center;
            height: 40vh;
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
                <li class="active"><a href="BuyerLR.jsp">Buyer</a></li>
                <li><a href="AgentLogin.jsp">Agent</a></li>
                <li><a href="SellerLR.jsp">Seller</a></li>
                <li><a href="contact.jsp">ContactUs</a></li>
            </ul>
        </div>
    </nav>
    <br><br>
    <br><br>
    <section id="Login">
        <div class="container">
            <div class="row card-container">
                <div class="col-sm-6 col-md-4">
                    <div class="card">
                        <h3><b>BUYER LOGIN</b></h3>
                        <hr>
                        <%
                            if(session.getAttribute("error") != null) {
                                out.print("<h5 style=\"color:red;\">" + session.getAttribute("error") + "</h5>");
                                session.removeAttribute("error");
                            }
                        %>
                        <form action="ValidateBuyerLogin.jsp" method="post">
                            <p style="color: navy; font-size:1.9em;"><b>BuyerId:</b></p>
                            <input autocomplete="off" class="form-control" type="text" name="buyerId" placeholder="Enter BuyerId" required="">
                            <br><br>
                            <p style="color: navy; font-size:1.9em;"><b>Password:</b></p>
                            <input autocomplete="off" class="form-control" type="password" name="buyerPassword" placeholder="Enter Your Password." required="">
                            <br><br>
                            <button class="btn btn-primary"><span class="glyphicon glyphicon-log-in"></span> Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
