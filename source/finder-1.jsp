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

<h2>College Finder</h2>
<p>
	Have certain criteria? Find what schools you can go to!
</p>

	<form method="get" action="finder-results.jsp">
	<table>
	<tr>
		<td><input type="checkbox" name = "checked" value = "state"></td>    
		<td>State: </td>
		<td>
			<select name="state" size=1>
				<option value="Alabama">Alabama</option>
				<option value="Alaska">Alaska</option>
				<option value="Arizona">Arizona</option>
				<option value="Arkansas">Arkansas</option>
				<option value="California">California</option>
				<option value="Colorado">Colorado</option>
				<option value="Connecticut">Connecticut</option>
				<option value="Delaware">Delaware</option>
				<option value="District of Columbia">District of Columbia</option>
				<option value="Florida">Florida</option>
				<option value="Georgia">Georgia</option>
				<option value="Hawaii">Hawaii</option>
				<option value="Idaho">Idaho</option>
				<option value="Illinois">Illinois</option>
				<option value="Indiana">Indiana</option>
				<option value="Iowa">Iowa</option>
				<option value="Kansas">Kansas</option>
				<option value="Kentucky">Kentucky</option>
				<option value="Louisiana">Louisiana</option>
				<option value="Maine">Maine</option>
				<option value="Maryland">Maryland</option>
				<option value="Massachusetts">Massachusetts</option>
				<option value="Michigan">Michigan</option>
				<option value="Minnesota">Minnesota</option>
				<option value="Mississppi">Mississippi</option>
				<option value="Missouri">Missouri</option>
				<option value="Montana">Montana</option>
				<option value="Nebraska">Nebraska</option>
				<option value="Nevada">Nevada</option>
				<option value="New Hampshire">New Hampshire</option>
				<option value="New Jersey">New Jersey</option>
				<option value="New Mexico">New Mexico</option>
				<option value="New York">New York</option>
				<option value="North Carolina">North Carolina</option>
				<option value="North Dakota">North Dakota</option>
				<option value="Ohio">Ohio</option>
				<option value="Oklahoma">Oklahoma</option>
				<option value="Oregon">Oregon</option>
				<option value="Pennsylvania">Pennsylvania</option>
				<option value="Rhode Island">Rhode Island</option>
				<option value="South Carolina">South Carolina</option>
				<option value="South Dakota">South Dakota</option>
				<option value="Tennessee">Tennessee</option>
				<option value="Texas">Texas</option>
				<option value="Utah">Utah</option>
				<option value="Vermont">Vermont</option>
				<option value="Virginia">Virginia</option>
				<option value="Washington">Washington</option>
				<option value="West Virginia">West Virginia</option>
				<option value="Wisconsin">Wisconsin</option>
				<option value="Wyoming">Wyoming</option>
				<option value="American Samoa">American Samoa</option>
				<option value="Guam">Guam</option>
				<option value="Northern Marianas">Northern Marianas</option>
				<option value="Puerto Rico">Puerto Rico</option>
				<option value="Virgin Islands">Virgin Islands</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td><input type="checkbox" name = "checked" value = "tuitionInState"></td>
		<td>Tuition (In State): </td>
		<td><select name="tuitionInState_inequality" size=1>
				<option value="<">less than</option>
				<option value=">">greater than</option> </select></td>
		<td><input type="text" name="tuitionInState"></td>
	</tr>
	
	<tr>
		<td><input type="checkbox" name = "checked" value = "tuitionOutOfState"></td>
		<td>Tuition (Out of State): </td>
		<td><select name="tuitionOutOfState_inequality" size=1>
				<option value="<">less than</option>
				<option value=">">greater than</option> </select></td>
		<td><input type="text" name="tuitionOutOfState"></td>
	</tr>
	
	<tr>
		<td><input type="checkbox" name = "checked" value = "totalPriceInState"></td>
		<td>Total Price (In State): </td>
		<td><select name="totalPriceInState_inequality" size=1>
				<option value="<">less than</option>
				<option value=">">greater than</option> </select></td>
		<td><input type="text" name="totalPriceInState"></td>
	</tr>
	
	<tr>
		<td><input type="checkbox" name = "checked" value = "totalPriceOutOfState"></td>
		<td>Total Price (Out of State): </td>
		<td><select name="totalPriceOutOfState_inequality" size=1>
				<option value="<">less than</option>
				<option value=">">greater than</option> </select></td>
		<td><input type="text" name="totalPriceOutOfState"></td>
	</tr>
	
	<tr>
		<td><input type="checkbox" name = "checked" value = "financialAid"></td>
		<td>Average Financial Aid: </td>
		<td><select name="financialAid_inequality" size=1>
				<option value="<">less than</option>
				<option value=">">greater than</option> </select></td>
		<td><input type="text" name="financialAid"></td>
	</tr>
	
	<tr>
		<td><input type="checkbox" name = "checked" value = "studentLoans"></td>
		<td>Average Student Loans: </td>
		<td><select name="studentLoans_inequality" size=1>
				<option value="<">less than</option>
				<option value=">">greater than</option> </select></td>
		<td><input type="text" name="studentLoans"></td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Go!">
	</form>
<br>

</body>
</html>