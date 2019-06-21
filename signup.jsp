<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.util.*,java.io.*" %>
<%

String userid=request.getParameter("email");
String pwd=request.getParameter("psw");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root",
"root");
Statement st= con.createStatement();
int result=st.executeUpdate("insert into company values('"+userid+"','"+pwd+"')");

out.println("welcome "+userid+" to Decarita pizza!!!");
%>
<html>
<head>
<title>new user sign up</title>
</head>
<body>
<br>
<br>
      <marquee color="blue">Decarita pizza welcomes you :-)</marquee>
<br>
<br>
<h4 align="center">Place your first order</h4>

<br>
<br>
<a href="menu.html" align="center">Click here to view menu</a>
</body>
</html>



