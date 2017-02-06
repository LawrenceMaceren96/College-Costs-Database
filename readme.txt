Lawrence Maceren 158001833
George Elia 159003227

Our project works on every browser we were able to test it on. However, we did a majority of our testing on Google Chrome,
so it is the preferred browser

The URL for our home page is: http://ec2-54-174-135-178.compute-1.amazonaws.com:8080/cs336Final/factchecker-1.jsp

Our frontend code for the database are in a folder called source. They are all jsp files, We used the template project as a starting point, so all the metadata from that is roughly the same, with changes made to make our project the primary files. 
Our database was populated using mySQLWorkbench. 
The sources of our data was:
https://nces.ed.gov/ipeds/datacenter/Default.aspx 
http://www.census.gov/people/io/files/Table%201.%20Field%20of%20degree.xlsx
http://www.census.gov/people/io/files/Table%204.%20Earnings.xlsx

Example queries can be found in queries.txt, and the results in examplesqueries folder.
These example queries are related, but are not the exact same as the websites queries.
The website queries were derived from the example queries.

ER Diagram (ER Diagram.pdf)
Entities (Attributes):
-School (name, state, tuitionInState, tuitionOutOfState, totalPriceInState, totalPriceOutOfState, financialAid, studentLoans)
-Major (major, Average_Salary)
-Race(race)
-Gender(gender)
-Occupation(name, Average_Salary)

Relationships (Entities)
-Racial_Occupation_Salary(Race, Occupation,Occupation_Salary)
-Gender_Occupation_Salary(Gender, Occupation, Occupation_Salary)
-Racial_Major_Salary(Race, Major,Major_Salary)
-Gender_Major_Salary(Gender, Major, Major_Salary)

10 Tuples per Table- All tables in tables folder
-School Table: SchoolTuples.csv
-Gender Table: GenderTuples.csv
-Major Table: MajorTuples.csv
-Occupation Table: OccupationTuples.csv
-Race Table: RaceTuples.csv
-Gender_Major_Salary Table: Gender_Major_Salary Tuples.csv
-Gender_Occupation_Salary Table: Gender_Occupation_Salary Tuples.csv
-Race_Major_Salary Table: Race_Major_SalaryTuples.csv
-Race_Occupation_Salary Table: Race_Occupation_SalaryTuples.csv