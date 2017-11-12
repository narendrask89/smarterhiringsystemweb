<%-- 
    Document   : savejobdetails
    Created on : Nov 18, 2008, 1:17:33 PM
    Author     : Narendra
--%>
<%@page import="java.io.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>www.CarrierMithr.com</title>
        <style type="text/css">
<!--
.style1 {
	font-size: 5px;
	font-weight: bold;
}
.style2 {
	font-size: 10pt
}
-->
        </style>
</head>
    <body background="wpa552ad7e[1].png">
         <% try
          {
         String jobid=request.getParameter("jobid");
         String post=request.getParameter("post");
         String criteria=request.getParameter("criteria");
         String vacancies=request.getParameter("vacancies");
         String salary=request.getParameter("salary");
         String lastdate=request.getParameter("lastdate");
         ServletContext context=getServletConfig().getServletContext();
         String comp_id=(String)context.getAttribute("comp_user");
         
         Class.forName("com.mysql.jdbc.Driver");
           	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shsdb?autoReconnect=true&useSSL=false","root","admin");
          	
           	
		PreparedStatement st=con.prepareStatement("insert into JobDetails values(?,?,?,?,?,?,?)");
        st.setString(1,jobid);  	
        st.setString(2,comp_id);
        st.setString(3,post);
        st.setString(4,criteria);
        st.setString(5,vacancies);
        st.setString(6,salary);
        st.setString(7,lastdate);
		st.executeUpdate();


           %>
           <font color="red" size="5"><br>
           <% out.println("Data submitted successfully!!!");%>
           <br>
    </font> 
    <%
           st.close();

          }
           catch(Exception e)
                   {
        	   out.println(e);
                   }
        
           %>
         
    <p class="style1"><font color="red"><a href="CompanyHomePage.jsp" class="style2">Goto Home</a></font> </p>
</body>
</html>
