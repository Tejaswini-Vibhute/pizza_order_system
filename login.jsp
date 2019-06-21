<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%

String userid=request.getParameter("email");
String pwd=request.getParameter("psw");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con =DriverManager.getConnection("jdbc:mysql://localhost/db","root",
"root");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from company where uname='"+userid+"'");

if(rs.next())
{
if(rs.getString(2).equals(pwd))
{
out.println("welcome back "+userid+" to our Decarita pizza !" );
}
else
{
out.println("Invalid password");
}
}

%>

<!DOCTYPE html>
<html>
<form action="place.html" name ="f1">
<body>
<button type="submit">Proceed</button>
</body>
</form>
</html>

