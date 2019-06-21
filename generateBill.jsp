
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String quantity[]=request.getParameterValues("itemCount");
            String total[]=request.getParameterValues("itemTotal");
            String name[]=request.getParameterValues("itemName");
            //out.print(request.getParameter("itemTotal"));
            String finalTotal=request.getParameter("total");
            String username=request.getParameter("uname");
            //String email=request.getParameter("email_id");
            //out.println(finalTotal);
	    //out.println(username);
            %>
	<div style="background-color:orange">
		<br><br>
	    <h1 align="center" >Decarita pizza</h1>		
            <h3 align="center">Payment Invoice</h3>
		<br><br>
	</div>
	<br><br>
            <table border="1" style="border-spacing: 0px;" align="center">
                <tr><th>Sr.No</th><th>Item Name</th><th>Item Price</th><th>Item Count</th><th>Total</th></tr>
            
            <%
                try
                {
		    //out.println(finalTotal);
                    Date date=new Date();
                    String id = ""+date.getTime();
                 
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost/db","root","root");
                    
                    Statement st=con.createStatement();
                    
                    int result=st.executeUpdate("insert into orderDetails values('"+id+"','"+username+"',"+Integer.parseInt(finalTotal)+")");
                    int j=1;
                for(int i=0;i<total.length;i++)
                {
                    String parts[]=name[i].split("-");
			if(Integer.parseInt(quantity[i])>0){
                out.print("<tr><td>"+(j)+"</td><td>"+parts[0]+"</td><td> "+parts[1]+"</td><td>"+quantity[i]+"</td><td>"+total[i]+"</td></tr>\n");
                st.executeUpdate("insert into order_info values('"+id+"','"+parts[0]+"', "+Integer.parseInt(quantity[i])+","+Integer.parseInt(total[i])+")");
j++;
                }
		}	
                }
               catch(Exception e)
               {
                   out.println(e.toString());
               }
		out.println("<br>");
   		out.println("<h3 align='center'>Total Payment ==> "+finalTotal+"</h3>");
                %>
            </table>
	    <br><br><br>
            <h3 align="center">Thank You placing order. :)</h3>
	    <footer style="background-color:brown" >
        	<br>
        	<p align="center">Decarita pizza || Order Food</p>
        	<p align="center">Contact information: <a href="#" >decaritapizza@example.com</a>
        	</p>
        	<br><br>
   	   </footer>
    </body>
</html>
