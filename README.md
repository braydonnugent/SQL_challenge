# SQL_challenge
Module 9

PLEASE FIND ATTACHED THE FOLLOWING FILES:

WITHIN EmployeeSQL FOLDER, PLEASE FIND:

SQL_data_config: SQL script used to engineer the 6 table's content & analyse the 8 provided questions.

Table Data Diagram (Quick DBD): Diagram of Data build process, illustrating necessary Foreign Key relationships which were implemented in the SQL script.

Quick DBD script for diagram.txt: Script responsible for creating 'Table Data Diagram (Quick DBD)'. (Directly correlates with tables engineered by the SQL script, despite their different syntax).

WITHIN Starter_Code FOLDER, PLEASE FIND:
data folder containing all the provided csv files which were sourced by provided SQL script in previously stated file.

TABLE HEADS
------------
DEPARTMENT TABLE SCREENSHOT (HEAD):

<img width="322" alt="image" src="https://github.com/braydonnugent/SQL_challenge/assets/142812919/c8d04000-68d7-4e7e-b507-4b7d1dfd565c">


TITLES TABLE SCREENSHOT (HEAD):

<img width="304" alt="image" src="https://github.com/braydonnugent/SQL_challenge/assets/142812919/10928bd0-4477-469a-bb3d-f7dbc252ade2">


SALARIES TABLE SCREENSHOT (HEAD):

<img width="230" alt="image" src="https://github.com/braydonnugent/SQL_challenge/assets/142812919/1ff241f6-deef-4053-bf27-f54725a79331">


DEPT_EMP TABLE SCREENSHOT (HEAD):

<img width="266" alt="image" src="https://github.com/braydonnugent/SQL_challenge/assets/142812919/8e4bc2cb-e569-4153-b7a4-ad3b8ce487c5">


DEPT_MANAGER TABLE SCREENSHOT (HEAD):

<img width="287" alt="image" src="https://github.com/braydonnugent/SQL_challenge/assets/142812919/228960b5-6a1a-414f-9e56-08e411594fdf">


EMPLOYEES TABLE SCREENSHOT (HEAD):

<img width="743" alt="image" src="https://github.com/braydonnugent/SQL_challenge/assets/142812919/c1343aa7-ea22-4e99-9df1-23bd974598e0">


NOTES & ACKNOWLEDGEMENTS:
-------------------------
DATES IN EMPLOYEES TABLE
birth_date & hire_date were set as VARCHAR as opposed to DATE, because the date format was 'out of range'. Additionally I knew a fuzzy match could be incorporated to answer the question isolating employees hired in 1986.

GENERAL CORRELATIONS WITH FOREIGN KEYS
There are likely more correlations which could be made such as the foreign key 'emp_no' relationship between the employees & dept_emp tables. However it is believed to be redundant as the same key correlates between salaries & dept_emp. 

Ultimately minimal correlations were used to achieve the desired result.

VARCHAR LIMITS
Despite there being no necessary difference in having a limit for VARCHAR datatypes, they were implemented nonetheless as it was part of the criteria. There was no clear indicator as to what the VARCHAR limits should be, so leniant values were provided to avoid the risk of leaving out certain rows in the data. Afterall, the main tables are supposed to consist of the raw data provided by the task materials.

I hope these notes & acknowledgements are useful & understandable.
