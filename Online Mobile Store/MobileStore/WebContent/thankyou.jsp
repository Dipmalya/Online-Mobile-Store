<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.Login.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Confirmed</title>
<link rel="icon" href="images/tensbit.ico" type="image"/>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<%!
boolean checkuser = false;
User user;
%>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("token")==null)
    response.sendRedirect("Login.jsp");

if (session.getAttribute("token_user")!=null){
user = (User)session.getAttribute("user");
checkuser = true;
}
%>
<div id="header">
  <table width="489" height="176" id="headtable">
    <tr>
      <td width="481" height="147"><a href="index.html"><div align="center"><span id="head">tens</span><span id="head1">bit</span></div></a></td>
    </tr>
    <tr>
      <td height="21"><div align="center"><span id="tagline">Your Trust Our Priority </span></div></td>
    </tr>
  </table>
  
  <div align="right">
    <table width="418" id="taglist">
      <tr>
        <td width="25"><img src="images/tick.png" height="25px" width="25px"/></td>
        <td width="377"><div align="left">Phones from trusted brands </div></td>
      </tr>
      <tr>
        <td><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>Best deals for your favourite smartphones </td>
      </tr>
      <tr>
        <td><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>Monthly Discounts on selected brands </td>
      </tr>
      <tr>
        <td><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>In a day delivery available </td>
      </tr>
      <tr>
        <td height="23"><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>Cash on Delivery Available </td>
      </tr>
    </table>
  </div>
</div>
<div id="navbar">
<div id="menu">
<ul>
<li>
<% if (!checkuser){ %><a href="Login.jsp">Login</a><%} %>
<% if (checkuser) { %><a>Hi <%=user.getFirstName() %></a>
<ul><li><a href="profile.jsp?email=<%=user.getEmail()%>">Profile</a></li>
<li><a href="LogoutServlet">Log Out</a></li>
</ul></li><%} %>
<li><a href="cart.jsp">Cart</a></li>
<li><a href="contact.jsp">Contact</a></li>
</ul>
</div>
<div>
		<form id="tfnewsearch" method="post" action="http://www.google.com">
		        <input type="text" class="tftextinput" name="q" size="21" maxlength="120"><input type="submit" value=">" class="tfbutton">
		</form>
	<div class="tfclear"></div>
  </div>
</div>
<div id="thankyou">
<p>Thank you for choosing us. Your order will be delivered on time.</p>
<form action="search.jsp"><input type="submit" value="Continue Shopping" class="tfbutton4"/></form>
<form action="home.jsp"><input type="submit" value="Home" class="tfbutton5"/></form>
</div>
<div id="footer">
<table>
  <tr>
    <td width="33%">Copyright &copy; 2016 tensbit || All Rights Reserved</td>
    <td width="33%"><span style="font-family:verdana;font-size:20px;color:white;">Social :</span> <a id="facebook" href="http://www.facebook.com/tensbit" target="_blank">Facebook</a>&nbsp;<a id="twitter" href="http://www.twitter.com/tensbit" target="_blank">Twitter</a>
	&nbsp;<a id="gplus" href="http://www.plus.google.com/tensbit" target="_blank">Google+</a></td>
	<td width="33%"><span style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:16px;">Policies : </span><a style="text-decoration:none;color:white;" href="security.html">Security</a>,&nbsp;
	<a style="text-decoration:none;color:white;" href="contact.jsp">24x7 Contact</a>,&nbsp;<a style="text-decoration:none;color:white;" href="uses.html">Terms of Use</a></td>
  </tr>
</table>
</div>
</body>
</html>