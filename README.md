# Medical-Database-System
MedConnect Health System seeks to develop a comprehensive relational database to streamline its healthcare services. The database should encompass critical modules such as Patient, Healthcare Professional, Medical Records, Appointments, Treatments, Billing, and Pharmacy.

A Person can be a Patient or a healthcare professional. A person can be both a Patient and a healthcare professional. Details of a person such as Person ID, Name (First, Middle, Last), Address (Street, City, State, ZIP), Gender, Date of Birth, and Phone number (one person can have more than one phone number) are recorded. The Person ID should have the format “P-XXX” where X is a number from 0 to 9.

Each patient's personal details including Patient ID, Name (First, Middle, Last), Address, Gender, Date of Birth, multiple Email address, and multiple Contact numbers need to be stored. Patient IDs should follow the format “PT-XXXXX”, where “X” is a number from 0 to 9(Hint: you can use regexp_like() function). Patients may have multiple associated medical records and may be assigned to various healthcare professionals for different needs.

Healthcare Professional information should include details for employees such as Employee ID, Name, Address, Specialization, Department, Contact Information, Years of Experience (minimum of 0 and a maximum based on the professional's age), and Working Hours. Employee IDs should have the format “EMP-XXX”. Healthcare Professionals must be at least 18 years old. Healthcare profe ssionals can be Doctors, Nurses, Technicians, or Administrative staff. Each professional may be associated with multiple patients and treatments. A doctor could also be an Administrative staff. 

The database should maintain a comprehensive medical record for each patient, including past diagnoses, treatment history, allergies (constraints on the values based on a predefined list of common allergens), current medications, and lab results. Each record must be uniquely identified and linked to the corresponding patient and authorized healthcare professionals.

Appointments between patients and healthcare professionals must be tracked, including Appointment ID, Patient ID, Professional ID, Date, Time, and Purpose.

Details of treatments prescribed by healthcare professionals to patients should be recorded, including Treatment ID, Description, Start Date, End Date, and Outcome. Each treatment is linked to one or more prescription records.

All billing information related to patient treatments, hospital stays, and procedures should be stored, including Billing ID, Patient ID, Date, Itemized Costs, Total Cost, and Payment Method. Billing records must be linked to respective Patient IDs and should accommodate multiple payment methods and installment plans. Payment Methods may be either Cash, Credit, or Insurance. Insurance information should contain the insurance company, insurance ID, amount,, etc.
