<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%
    // Retrieve form parameters
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
    String ratingStr = request.getParameter("rating");

    // Set default rating if not provided
    int rating = 0;
    if (ratingStr != null && !ratingStr.isEmpty()) {
        try {
            rating = Integer.parseInt(ratingStr);
        } catch (NumberFormatException e) {
            rating = 0; // Default rating in case of parsing error
        }
    }

    // Prepare SQL query
    String sql = "INSERT INTO contactus (name, email, message, rating) VALUES (?, ?, ?, ?)";
    
    Connection con = null;
    PreparedStatement pstmt = null;
    try {
        // Establish connection
        con = DriverManager.getConnection(url, user, pass);
        pstmt = con.prepareStatement(sql);

        // Set parameters
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, message);
        pstmt.setInt(4, rating);

        // Execute query
        int result = pstmt.executeUpdate();

        if (result > 0) {
            // Redirect to a thank you page if insertion is successful
            response.sendRedirect("thank_you.jsp");
        } else {
            // Handle case where no rows were affected
            out.println("Failed to insert data.");
        }
    } catch (SQLException e) {
        // Handle SQL errors
        e.printStackTrace();
        out.println("SQL Error: " + e.getMessage());
    } finally {
        // Close resources
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
