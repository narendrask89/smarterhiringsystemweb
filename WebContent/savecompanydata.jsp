<%-- 
    Document   : savecompanydata
    Created on : Nov 14, 2008, 10:39:55 AM
    Author     : Narendra
--%>
<%@page import="java.io.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>www.smarterhiring.com</title>
    </head>
    <body bgcolor="#E2C2CB">
        <% try
          {
         
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shsdb?autoReconnect=true&useSSL=false","root","admin");
          
            Statement st=con.createStatement();
          Statement st2=con.createStatement();
          
          String stat="c";
          st2.executeUpdate("insert into Login values('"+request.getParameter("comusername")+"','"+request.getParameter("compassword")+"','"+stat+"')");
          st.executeUpdate("insert into Com(CName,CAddress,CPost,CCriteria,CUsername,CEmail,CContact,CCutoff) values('"+request.getParameter("comname")+"','"+request.getParameter("comaddress")+"','"+request.getParameter("compost")+"','"+request.getParameter("comcriteria")+"','"+request.getParameter("comusername")+"','"+request.getParameter("comemail")+"','"+request.getParameter("comcontact")+"','"+request.getParameter("comcutoff")+"')");
          st.close();
          st2.close();
          %>
          <font color="red" size="5"><br>
          <%out.println("Registration Successfull!!!");%>
          <br>
          <%out.println("You will be activated soon... ");%>
          <br>
           <p><a href="Login.jsp">Go Forward</a></p>
     </font>
            <% }       
           catch(Exception e)
                   {
              		 out.println(e);
              		 %>
              		     <br/> <p><a href="Login.jsp">Go Forward</a></p> 
              		     <%
              		  }
           %>
       
           
    </body>
</html>
