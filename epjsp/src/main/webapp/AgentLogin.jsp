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
            padding-top: 70px; /* Adjust padding to accommodate the fixed navbar */
        }
        .navbar-brand i {
            margin-right: 10px;
        }
        .navbar-nav > li > a {
            padding-top: 15px;
            padding-bottom: 15px;
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
            margin: 0 auto; /* Center horizontally */
        }
        .card-container {
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
        }
        .form-group {
            margin-bottom: 10px; /* Decrease space between form groups */
        }
        .form-control {
            margin-bottom: 5px; /* Decrease space between input fields */
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
                <li class="active"><a href="#">Agent</a></li>
                <li><a href="SellerLR.jsp">Seller</a></li>
                <!-- <li><a href="EmployeeLogin.jsp">Employee</a></li> -->
                <li><a href="contact.jsp">ContactUs</a></li>
            </ul>
        </div>
    </nav>
    <section id="Agent">
        <div class="container">
            <div class="row card-container">
                <div class="col-sm-12 col-md-6">
                    <div class="card">
                        <h3 style="color: rgb(67, 68, 74); text-align: center;"><b>AGENT LOGIN</b></h3>
                        <hr>
                        <%
                            if (session.getAttribute("error") != null) {
                                out.print("<h5 style=\"color:red; text-align: center;\">" + session.getAttribute("error") + "</h5>");
                                session.removeAttribute("error");
                            }
                        %>
                        <form action="ValidateAgentLogin.jsp" method="post">
                            <div class="form-group">
                                <p style="color: navy; font-size: 1.9em;"><b>AgentId:</b></p>
                                <input autocomplete="off" class="form-control" type="text" name="agentId" placeholder="Enter Your AgentId" required="">
                            </div>
                            <div class="form-group">
                                <p style="color: navy; font-size: 1.9em;"><b>Password:</b></p>
                                <input autocomplete="off" class="form-control" type="password" name="agentPassword" placeholder="Enter Your Password" required="">
                            </div>
                            <button class="btn btn-primary btn-block"><span class="glyphicon glyphicon-log-in"></span> Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
