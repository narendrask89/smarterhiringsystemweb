<%@ page contentType="text/html; charset=utf-8" language="java"  import="java.sql.*" errorPage="" %>
<%@page import="java.io.*,java.sql.*" session="true" %>
<%

        String examID = request.getParameter("examid");
        String jobID = session.getAttribute("jobid").toString();

        String studentid=session.getAttribute("s1").toString();
        Connection con = null;
        PreparedStatement st,st1 = null;
        ResultSet rs,rs1 = null;

        int count=0;
        
        
        try {
            	Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shsdb?autoReconnect=true&useSSL=false","root","admin");
                PreparedStatement pstm=con.prepareStatement("select count(Questionno) from Question Where JobID=? and ExamID=?");
                pstm.setString(1,jobID);
                pstm.setString(2,examID);
                rs1=pstm.executeQuery();
            	if(rs1.next())
            	{
            		count=rs1.getInt(1);
            	}
            	
                for (int n = 0; n < count; n++) 
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shsdb?autoReconnect=true&useSSL=false","root","admin");
                    st = con.prepareStatement("select * from Question Where JobID=? and ExamID=? and QuestionNo=?");
                    st.setString(1,jobID);
                    st.setString(2,examID);
                    st.setString(3,String.valueOf(n+1));
                                
                    rs = st.executeQuery();

                    if(rs.next()) 
                    {
                   st1 = con.prepareStatement("Insert into Temp_Data values(?,?,?,?,?,?,?,?)");
                   st1.setString(1,studentid);
                   st1.setString(2,String.valueOf(n+1));
                   st1.setString(3,rs.getString(4));
                   st1.setString(4,rs.getString(5));
                   st1.setString(5,rs.getString(6));
                   st1.setString(6,rs.getString(7));
                   st1.setString(7,rs.getString(8));
                   st1.setString(8,rs.getString(9));
                   st1.executeUpdate();

                    }

                
                }
                session.setAttribute("mark","0");
                session.setAttribute("examid", examID);
                session.setAttribute("maxques",new Integer(count));
                response.sendRedirect("dispqst.jsp?qno=1");
                
            } catch (Exception ex) {
                out.println("Error: Cannot go forward<br>" + ex.toString() );
            }
        
%>


