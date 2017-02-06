<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>College Costs</title>
</head>

<body>
<h1 align="center">College Costs</h1>
<h2 align="center">Pay for your dream school!</h2>
<p style="text-align:center;">
	<i>Worried about college costs?<br>
	Not sure if you can pay off your dream school with your dream job?<br>
	Interested in how demographics can affect your career?
	<br><br>
	Use this tool to see how attainable your dream school is!
</i></p>	

<p style="text-align:center;">
<a href="factchecker-1.jsp">College Fact Checker</a>
 | 
<a href="finder-1.jsp">College Finder</a>
 | 
<a href="Attainable.jsp">College Attainability Tool</a>
</p>

<!-- ABOVE THIS IS THE HEADER. BELOW THIS IS WHATEVER CODE YOU NEED FOR THE TOOL. -->

<h2>College Fact Checker</h2>
<p>
	Know your dream school? Use this tool to get some fast facts about it!
</p>

<form method="get" action="factchecker-results.jsp">

	<table>
	<tr>    
		<td>State: </td>
		<td> 
			<%
			try
			{
				String parameter = request.getParameter("state");
				out.print("<input type=\"hidden\" name=\"state\" value=\"" + parameter + "\">");
				out.print(parameter);
			}
			catch (Exception e) {}
			%>
		</td>
	</tr>
	
	<tr>
		<td>School: </td>
		<td>
				<%
				try
				{
					//Create a connection string
					String url = "jdbc:mysql://collegecostsdb.cdekarkayiai.us-east-1.rds.amazonaws.com:3306/george_schema";
					//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
					Class.forName("com.mysql.jdbc.Driver"); 
	
					//Create a connection to your DB
					Connection con = DriverManager.getConnection(url, "student", "password");
							
					//Create a SQL statement
					Statement stmt = con.createStatement();
					
					String parameter = request.getParameter("state");
					String myschool = request.getParameter("school");
					String str = "SELECT name FROM School WHERE state = \""+parameter+"\" ORDER BY name";
					
					ResultSet result = stmt.executeQuery(str);
					
					// Populate dropdown menu
					out.print("<select name=\"school\" size=1>");

					String school;
					while(result.next())
					{
						school = result.getString("name"); 
						
						if (school.equals(myschool)) // Preselect this option
						{
							out.print("<option value=\"" + school + "\" selected = \"selected\">" + school + "</option>");
						}
						else // This is not the selected option
						{
							out.print("<option value=\"" + school + "\">" + school + "</option>");
						}
					}
				}
				catch (Exception e) {}
				%>
			</select>
		</td>
	</tr>
	
	</table>
	<br>
	
	<table>
		<tr>
			<td>
				<input type="submit" value="Go!">
				</form>
			</td>
			<td>
				<form action="factchecker-1.jsp">
			    	<input type="submit" value="Pick New State" />
				</form>
			</td>
		</tr>
	</table>
	
<br>
	<%
		List<String> list = new ArrayList<String>();

		try {
					
			//Create a connection string
			String url = "jdbc:mysql://collegecostsdb.cdekarkayiai.us-east-1.rds.amazonaws.com:3306/george_schema";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver"); 

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "student", "password");
					
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the HelloWorld.jsp
			String entity = request.getParameter("school");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the HelloWorld.jsp
			String str = "SELECT name, tuitionInState, tuitionOutOfState, totalPriceInState, totalPriceOutOfState, financialAid, studentLoans FROM School WHERE name = \""+ entity +"\"";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//parse out the results
			result.next();
			
				out.print("<b>University Name: </b>");
				out.print(result.getString("name"));
				
				out.print("<br><b>Tuition (In State): </b>");
				out.print(result.getString("tuitionInState"));
				
				out.print("<br><b>Tuition (Out of State): </b>");
				out.print(result.getString("tuitionOutOfState"));
				
				out.print("<br><b>Total Price (In State): </b>");
				out.print(result.getString("totalPriceInState"));
				
				out.print("<br><b>Total Price (Out of State): </b>");
				out.print(result.getString("totalPriceOutOfState"));
				
				out.print("<br><b>Average Financial Aid: </b>");
				out.print(result.getString("financialAid"));
				
				out.print("<br><b>Average Student Loans: </b>");
				out.print(result.getString("studentLoans"));

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>