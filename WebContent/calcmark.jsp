<form id="form1" name="form1" method="post" action="calcmark.jsp">
    <input name="OK" type="submit" id="OK" value="Submit" />
</form>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" session="true" %>
<%
        Connection con;
        Statement st;
        //ResultSet rs;
        String sql;

        int maxques=Integer.parseInt(session.getAttribute("maxques").toString());
        int mark = Integer.parseInt(session.getAttribute("mark").toString());
        String ch = request.getParameter("ch");
        String ans = request.getParameter("ans");
        int qno = Integer.parseInt(request.getParameter("qno"));
        if (ch != null) {

            ch = ch.trim();
            ans = ans.trim();
            if (ch.equalsIgnoreCase(ans)) {
                mark++;
                session.setAttribute("mark",new Integer(mark));

            }
        }
        if (qno < maxques) {
            response.sendRedirect("dispqst.jsp?qno=" + (qno + 1));
        } else {
            try {
                String studentid = session.getAttribute("s1").toString();
                sql = "delete from Temp_Data where StudentID='" + studentid + "'";
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shsdb?autoReconnect=true&useSSL=false","root","admin"); 
                st = con.createStatement();
                st.executeUpdate(sql);

                String examID = session.getAttribute("examid").toString();
                String jobID = session.getAttribute("jobid").toString();
                mark=Integer.parseInt(session.getAttribute("mark").toString());
                sql="Insert into Result values('" + studentid + "','" +  examID + "','" + jobID + "','" + mark + "','" + maxques + "')";
                st.executeUpdate(sql);
                response.sendRedirect("dispresult.jsp");
            } catch (Exception ex) {
                out.println(ex.toString());
            }

        }

%>