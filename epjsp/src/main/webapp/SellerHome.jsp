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
    } else if(buyerId != null) {
        response.sendRedirect("BuyerHome.jsp");
    } else if(employeeId != null) {
        response.sendRedirect("EmployeeHome.jsp");
    } else if(sellerId == null) {
        response.sendRedirect("SellerLR.jsp");
    } else {
        // Seller is logged in, continue to show the Seller Home page
%>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <style>
        body {
            background: url('https://www.reminetwork.com/wp-content/uploads/businessman.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .navbar {
            margin-bottom: 70px;
            border-radius: 0;
        }

        #Buyer-Home {
            padding: 60px;
            border-radius: 10px;
        }
    </style>
</head>  
<body>  
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp"><i class="glyphicon glyphicon-home"></i> Real-Estate</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="BuyerLR.jsp">Buyer</a></li>
                <li><a href="AgentLogin.jsp">Agent</a></li>
                <li class="active"><a href="SellerLR.jsp">Seller</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
            </ul>
        </div>
    </nav>
    <br><br>
    <br><br>

    <div class="container">
        <div class="d-flex justify-content-center align-items-center">
            <div class="row">
                <div class="col-sm-4">
                    <h3><b>SELLER HOME</b></h3>
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <button type="button" onclick="location.href='UploadNewHouse.jsp'" class="btn btn-primary btn-lg btn-block">SELL/RENT A HOUSE</button>
                    <br><br>
                    <button type="button" onclick="location.href='ViewSellerHouses.jsp'" class="btn btn-primary btn-lg btn-block">VIEW HOUSES</button>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
</body>  
</html>  

<%
    }
%>
