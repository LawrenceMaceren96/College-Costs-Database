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
				<option value="Male">Male</option>
				<option value="Female">Female</option>
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
  </table>
  <br>
  <input type="submit" value="Go!" />
</form>

<br>
	<%
		List<String> list = new ArrayList<String>();

		try {
			int []salaries = new int[6];
			//Create a connection string
			String url = "jdbc:mysql://collegecostsdb.cdekarkayiai.us-east-1.rds.amazonaws.com:3306/george_schema";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "student", "password");

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String gender = request.getParameter("gender");
			String race = request.getParameter("race");
			String occupation = request.getParameter("occupation");
			String major = request.getParameter("major");
			String printGender = Character.toUpperCase(gender.charAt(0)) + gender.substring(1);
			
			//Start Occupation Queries
			//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
			String str = "SELECT Occupation.Average_Salary FROM Occupation WHERE Occupation.name = \"" + occupation + "\"";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			result.next();
			salaries[0] = result.getInt("Average_Salary");
			out.print("<b>Occupation: " + occupation + "</b><br> Average Salary: " + salaries[0]);
			
			str = "SELECT Gender_Occupation_Salary.Occupation_Salary FROM Gender_Occupation_Salary"; 
			str = str + " WHERE Gender_Occupation_Salary.Gender = \"" +gender + "\"";
			str = str + " AND Gender_Occupation_Salary.Occupation = \"" + occupation + "\"";
			//Run the query against the database.
			result = stmt.executeQuery(str);
			result.next();
			salaries[1] = result.getInt("Occupation_Salary");
			out.print("<br> " + printGender + " Average Salary: " + salaries[1]);

			str = "SELECT Race_Occupation_Salary.Occupation_Salary FROM Race_Occupation_Salary"; 
			str = str + " WHERE Race_Occupation_Salary.Race = \"" + race + "\"";
			str = str + " AND Race_Occupation_Salary.Occupation = \"" + occupation + "\"";
			//Run the query against the database.
			result = stmt.executeQuery(str);
			result.next();
			salaries[2] = result.getInt("Occupation_Salary");
			out.print("<br> " + race + " Average Salary: " + salaries[2]);
			String likely = "";
			if((salaries[1] + salaries[2])/2 > salaries[0])
				likely = "MORE";
			else
				likely = "LESS";
			out.print("<br><br>Because of your race and gender, you are likely to earn " + likely);
			out.print(" than the average in your chosen occupation.");
			
			//Start Major Queries
			str = "SELECT Major.Average_Salary FROM Major WHERE Major.Major = \"" + major + "\"";
			result = stmt.executeQuery(str);
			result.next();
			salaries[3] = result.getInt("Average_Salary");
			out.print("<br><br><b>Major: " + major + "</b><br> Average Salary: " + salaries[3]);
			
			str = "SELECT Gender_Major_Salary.Major_Salary FROM Gender_Major_Salary"; 
			str = str + " WHERE Gender_Major_Salary.Gender = \"" +gender + "\"";
			str = str + " AND Gender_Major_Salary.Major = \"" + major + "\"";
			//Run the query against the database.
			result = stmt.executeQuery(str);
			result.next();
			salaries[4] = result.getInt("Major_Salary");
			out.print("<br> " + printGender + " Average Salary: " + salaries[4]);

			str = "SELECT Race_Major_Salary.Major_Salary FROM Race_Major_Salary"; 
			str = str + " WHERE Race_Major_Salary.Race = \"" + race + "\"";
			str = str + " AND Race_Major_Salary.Major = \"" + major + "\"";
			//Run the query against the database.
			result = stmt.executeQuery(str);
			result.next();
			salaries[5] = result.getInt("Major_Salary");
			out.print("<br>" + race + " Average Salary: " + salaries[5]);
		
			likely = "";
			if((salaries[4] + salaries[5])/2 > salaries[3])
				likely = "MORE";
			else
				likely = "LESS";
			out.print("<br><br>Because of your race and gender, you are likely to earn " + likely);
			out.print(" than the average with your chosen major.");
			
			// Get price of school
			String school = request.getParameter("school");
			str = "SELECT totalPriceInState FROM School WHERE name = \"" + school + "\""; 
			//Run the query against the database.
			result = stmt.executeQuery(str);
			result.next();
			int price = result.getInt("totalPriceInState");
			
			//close the connection.
			con.close();
			
			// Only do price calculations if price is given
			if (price>0)
			{
				out.print("<br><br><b> Total Price of University Per Semester: </b>" + price);
				
				// Cost of 4 years of college
				int totalPrice = 4 * price;
				
				// Calculate amount of time to pay
				int years = 0;
				int salariesTotal = salaries[1] + salaries[2] + salaries[4] + salaries[5];
				salariesTotal = salariesTotal/4;
				salariesTotal = (int)(0.15 * salariesTotal);
				years = (int)(totalPrice / salariesTotal) + 1; 
				// Print final info
				out.print("<br><br><b>For your estimated cost of college, it may take approximately this long to pay off college fees: </b><br>");
				out.print(years + " years to pay back your tuition if you went to school for 4 total years");
			}
			else
				out.print("<br><br><b> No college price data available. Please choose another school. </b>");

		} catch (Exception e) {
		}
	%>

</body>
</html>