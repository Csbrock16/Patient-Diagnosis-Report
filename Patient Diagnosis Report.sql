#(1) Write a query to create a patients table with the fields such as date, patient id, patient name, age, weight, gender, location, phone number, disease, doctor name, and doctor id.
Create database patient_diagnosis;
Use patient_diagnosis;
Create table patients(
dates varchar(12), 
patient_id varchar(50),
patient_name char(12), 
age int, 
weight int, 
gender char(10),
location char(50),
phone_number int,
disease char(50),
doctor_name char(50),
doctor_id int
);

#(2) Write a query to insert values into the patients table
Insert into patients(dates, patient_id, patient_name, age, weight, gender, location, phone_number, disease, doctor_name, doctor_id)
values 
('2019-06-15', 'AP2021', 'Sarath', 67, 76, 'Male', 'chennai', 5462829, 'Cardiac', 'Mohan', 21),
('2019-02-13', 'AP2022', 'John', 62, 80, 'Male', 'banglore', 1234731, 'Cancer', 'Suraj', 22),
('2018-01-08', 'AP2023', 'Henry', 43, 65, 'Male', 'Kerala', 9028320, 'Liver', 'Mehta', 23),
('2020-02-04', 'AP2024', 'Carl', 56, 72, 'Female', 'Mumbai', 9293829, 'Asthma', 'Karthik', 24),
('2017-09-15', 'AP2025', 'Shikar', 55, 71, 'Male', 'Delhi', 7821281, 'Cardiac', 'Mohan', 21),
('2018-07-22', 'AP2026', 'Piysuh', 47, 59, 'Male', 'Haryana', 8912819, 'Cancer', 'Suraj', 22),
('2017-03-25', 'AP2027', 'Stephen', 69, 55, 'Male', 'Gujarat', 8888211, 'Liver', 'Mehta', 23),
('2019-04-22', 'AP2028', 'Aaron', 75, 53, 'Male', 'Banglore', 9012192, 'Asthma', 'Karthik', 24);

#(3) Write a query to display the total number of patients in the table -- Start with select then Count command (*) As New column name From table name
Select Count(*) AS total_patients From patients; 

#(4) Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum -- List the columns then add from the selected table then the where command age (select max() from table)
Select patient_id, patient_name, gender, disease
From patients
Where age = (Select Max(age) From patients); 

#(5) Write a query to display patient id and patient name with the current date -- select column names followed by the NOW function as the new column name from the table set
SELECT patient_id, patient_name, now() AS current_dates
FROM patients;

#(6) Write a query to display the old patient’s name and new patient's name in uppercase -- select the ucase command followed by column and from table
Select ucase(patient_name) From patients; 

#(7) Write a query to display the patient’s name along with the length of their name -- select the chosen column followed by the length command of the selected column AS new column name from table 
Select patient_name, length(patient_name) As Name_length
From Patients;

#(8) Write a query to display the patient’s name, and the gender of the patient must be mentioned as M or F -- Select first column name followed by the IF function
Select patient_name,
IF (gender = 'Male', 'M', IF (gender = 'Female', 'F', 'unknown')) AS gender 
From patients; 

#(9) Write a query to combine the names of the patient and the doctor in a new column -- use the Concat function
Select Concat(patient_name, '', doctor_name) As patient_doctor 
From Patients; 

#(10) Write a query to display the patients’ age along with the logarithmic value (base 10) of their age --Use the LOG10 command
SELECT age,
    LOG10(age) AS age_logarithm
FROM 
    patients;
    
#(11) Write a query to extract the year from the given date in a separate column -- extract command
    Select dates,
    extract(year from dates) As Year_to_date
    from patients; 
    
#(12) Write a query to return NULL if the patient’s name and doctor’s name are similar else return the patient’s name -- IF command
    SELECT 
    patient_name,
    doctor_name,
    IF(patient_name = doctor_name, NULL, patient_name) AS result
FROM 
    patients;
    
#(13) Write a query to return Yes if the patient’s age is greater than 40 else return No -- If command 
    SELECT 
    patient_name,
    age,
    IF(age > 40, 'Yes', 'No') AS age_group
FROM 
    patients;
    
#(14) Write a query to display the doctor’s duplicate name from the table -- Using COUNT and GROUP BY keywords to eliminate the duplicate records.
    SELECT 
    doctor_name,
    COUNT(*) AS name_count
FROM 
    patients
GROUP BY 
    doctor_name
HAVING 
    COUNT(*) > 1;