<%@ page  import="java.sql.*" %>
<%
            String uname = request.getParameter("id");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shsdb?autoReconnect=true&useSSL=false","root","admin");
                Statement st = con.createStatement();
                String sql="delete from Com where CUsername='" + uname + "'";
                int x=st.executeUpdate(sql);
                if(x>0){
                    response.sendRedirect("AdminCompanyDetails.jsp");
                }else{
                    out.println("Error: cannot delete record"); 
                    
                }
                con.close();
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
%>