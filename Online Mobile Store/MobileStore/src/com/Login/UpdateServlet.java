package com.Login;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection myCon = null;
	PreparedStatement mySmt = null;
	User user;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("textfield8");
		String lname = request.getParameter("textfield");
		String password = request.getParameter("textfield7");
		String mobile = request.getParameter("textfield2");
		String address = request.getParameter("textarea");
		String email = request.getParameter("textfield3");
		String city = request.getParameter("textfield4");
		String state = request.getParameter("textfield5");
		String pincode = request.getParameter("textfield6");
		user = (User)request.getSession().getAttribute("user"); 
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");
			mySmt = myCon.prepareStatement("update users set first_name=?, last_name=?, password=?, mobile=?, address=?, email=?, city=?, state=?, pin_code=? where email=? ");
			mySmt.setString(1, fname);
			mySmt.setString(2, lname);
			mySmt.setString(3, password);
			mySmt.setString(4, mobile);
			mySmt.setString(5, address);
			mySmt.setString(6, email);
			mySmt.setString(7, city);
			mySmt.setString(8, state);
			mySmt.setString(9, pincode);
			mySmt.setString(10, user.getEmail());
			mySmt.executeUpdate();
			mySmt.close();
			myCon.close();
			response.sendRedirect("profile.jsp?email="+email);
		}
		catch(Exception e) 
		{
			System.out.println(e.toString());
		}

	}

}
