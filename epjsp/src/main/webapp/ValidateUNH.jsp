<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ include file = "connection.jsp" %>
<%@ page import="java.util.*" %>

<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String date = sdf.format(new Date());

  // for revalidation after logout.
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setHeader("Expires","0");

  String agentId = (String)session.getAttribute("agentId");
  String sellerId = (String)session.getAttribute("sellerId");
  String buyerId = (String)session.getAttribute("buyerId");
  String employeeId = (String)session.getAttribute("employeeId");

  if(buyerId != null) {
      response.sendRedirect("BuyerHome.jsp");
  } else if(sellerId != null) {
      response.sendRedirect("sellerHome.jsp");
  } else if(agentId == null) {
      response.sendRedirect("AgentLogin.jsp");
  }

  Connection conn = null;
  PreparedStatement stmt = null;
  ResultSet rset1 = null;
  Statement stmt1 = null;

  try {
      conn = DriverManager.getConnection(url, user, pass);
      conn.setAutoCommit(false);

      stmt1 = conn.createStatement();
      rset1 = stmt1.executeQuery("select agent_id from agents");
      ArrayList<String> agentIds = new ArrayList<>();

      while(rset1.next()) {
          agentIds.add(rset1.getString(1));
      }

      Random rand = new Random();
      int randIndex = rand.nextInt(agentIds.size());
      String randomAgentId = agentIds.get(randIndex);

      String city = request.getParameter("city");
      String street_name = request.getParameter("street");
      String apt_no = request.getParameter("houseNumber");
      String sale_price = request.getParameter("salePrice");
      String rent_price = request.getParameter("rentPrice");
      String specificatons = request.getParameter("specifications");
      String no_bedrooms = request.getParameter("numBedrooms");
      String type = request.getParameter("type");

      String query = "insert into house values(?,?,?,?,?,?,?,?,?,?,?,?)";
      stmt = conn.prepareStatement(query);

      String p = null;

      stmt.setString(1, p);
      stmt.setString(2, randomAgentId);
      stmt.setString(3, sellerId);
      stmt.setString(4, city);
      stmt.setString(5, street_name);
      stmt.setString(6, apt_no);
      stmt.setString(11, no_bedrooms);
      stmt.setString(12, specificatons);

      if(type.equals("sale")) {
          stmt.setString(7, sale_price);
          stmt.setString(8, p);
          stmt.setString(9, "N");
          stmt.setString(10, p);
      } else if(type.equals("rent")) {
          stmt.setString(7, p);
          stmt.setString(8, rent_price);
          stmt.setString(9, p);
          stmt.setString(10, "N");
      } else {
          stmt.setString(7, sale_price);
          stmt.setString(8, rent_price);
          stmt.setString(9, "N");
          stmt.setString(10, "N");
      }

      int rowsAffected = stmt.executeUpdate();

      if(rowsAffected == 0) {
          session.setAttribute("transactionFailed", "true");
          response.sendRedirect("UploadNewHouse.jsp");
          return;
      } else {
          session.setAttribute("transactionFailed", "false");
          response.sendRedirect("UploadNewHouse.jsp");
          conn.commit();
          return;
      }
  } catch(Exception e) {
      if (conn != null) {
          try {
              conn.rollback();
          } catch (SQLException se) {
              se.printStackTrace();
          }
      }
      session.setAttribute("transactionFailed", "true");
      response.sendRedirect("UploadNewHouse.jsp");
      out.println(e);
  } finally {
      if (rset1 != null) try { rset1.close(); } catch(SQLException e) { e.printStackTrace(); }
      if (stmt1 != null) try { stmt1.close(); } catch(SQLException e) { e.printStackTrace(); }
      if (stmt != null) try { stmt.close(); } catch(SQLException e) { e.printStackTrace(); }
      if (conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }
  }
%>
