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

<h2>College Attainability Tool</h2>
Will you be able to pay off these loans with your career?							  
<br>
<br>

 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
  
<form method="get" action="AttainabilityTool.jsp" enctype=text/plain>
<table>
	<tr>
		<td>Gender:</td>
		<td>
			<select name="gender" size=1>
				<option value="male">Male</option>
				<option value="female">Female</option>
		  	</select>
		</td>
	</tr>
	<tr>
	 	<td>Race:</td>
	 	<td>
		 	<select name="race" size=1>
				<option value="Asian">Asian</option>
				<option value="Black">Black</option>
				<option value="Hispanic or Latino"> Hispanic or Latino</option>
				<option value="White, not Hispanic">White, not Hispanic</option>
		  	</select>
	  	</td>
	</tr>
	<tr>
		<td>Occupation:</td>
		<td>
			<select name="occupation" size=1>
				<option value="Agriculture">Agriculture</option>
				<option value="Architects">Architects</option>
				<option value="Arts and entertainment"> Arts and entertainment</option>
				<option value="Business and financial">Business and financial</option>
				<option value="Computer workers">Computer workers</option>
				<option value="Construction and maintenance">Construction and maintenance</option>	
				<option value="Education">Education</option>
				<option value="Engineers">Engineers</option>
				<option value="Health care">Health care</option>
				<option value="Life scientists">Life scientists</option>
				<option value="Legal">Legal</option>
				<option value="Managers (non-STEM)">Managers (non-STEM)</option>
				<option value="Mathematicians and statisticians">Mathematicians and statisticians</option>
				<option value="Office support">Office support</option>
				<option value="Physical scientists">Physical scientists</option>
				<option value="Sales">Sales</option>
				<option value="Service">Service</option>
				<option value="Social scientists">Social scientists</option>
				<option value="Social services">Social services</option>
		  	</select>
		</td>
  	</tr>  
  	<tr> 
	  	<td>Major:</td>
	  	<td>
	  		<select name="major" size=1>
				<option value=" Biological agricultural and environmental science">Biological agricultural and environmental science</option>
				<option value=" Business">Business</option>
				<option value=" Communications">Communications</option>
				<option value=" Computers mathematics and statistics"> Computers mathematics and statistics</option>
				<option value=" Education">Education</option>
				<option value=" Engineering">Engineering</option>
				<option value=" Liberal arts and history">Liberal arts and history</option>	
				<option value=" Literature and languages">Literature and languages</option>
				<option value=" Multidisciplinary studies">Multidisciplinary studies</option>
				<option value=" Physical and related science">Physical and related science</option>
				<option value=" Psychology">Psychology</option>
				<option value=" Science- and engineering-related">Science- and engineering-related</option>
				<option value=" Social sciences">Social sciences</option>
				<option value=" Visual and performing arts">Visual and performing arts</option>
				<option value=" Other (e.g. criminal justice social work)">Other (e.g. criminal justice social work)</option>
	  		</select>
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

					String str = "SELECT name FROM School ORDER BY name";
					
					ResultSet result = stmt.executeQuery(str);
					
					// Populate dropdown menu
					out.print("<select name=\"school\" size=1>");

					String school;
					while(result.next())
					{
						school = result.getString("name");
						
						if (school.equals("Rutgers University-New Brunswick")) // Preselect this option
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
  		</td>
  	</tr>
  </table>
  <br>
  <input type="submit" value="Go!" />
</form>

</body>
</html>
