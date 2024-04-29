DROP SCHEMA IF EXISTS Phase3; -- take this line out
CREATE database Phase3;
USE Phase3;
CREATE TABLE PERSON (
    Person_id VARCHAR(10) PRIMARY KEY,
    FName text,  
    MName text,
    SName text,
    Date_of_birth DATE,
    Phone_number VARCHAR(15),
    Gender CHAR(1),
    Address VARCHAR(255),
    Email VARCHAR(100),
    CHECK(REGEXP_LIKE(Person_id, '^P-[0-9]{3}$'))
);

CREATE TABLE HEALTHCARE_PROFESSIONAL (
    Person_id VARCHAR(10),
    Employee_id VARCHAR(10) PRIMARY KEY,
    FName text,
    MName text,
    SName text,
    Specialization VARCHAR(100),
    Department VARCHAR(100),
    Working_hours VARCHAR(50),
    Years_of_experience INT,
    Address VARCHAR(255),
    FOREIGN KEY(Person_id) REFERENCES PERSON(Person_id),
    CHECK(REGEXP_LIKE(Employee_id, '^EMP-[0-9]{3}$'))
);

CREATE TABLE PATIENT (
    Person_id VARCHAR(10),
    Patient_id VARCHAR(10) PRIMARY KEY,
    FName text,
    MName text,
    SName text,
    Medical_history TEXT,
    FOREIGN KEY(Person_id) REFERENCES PERSON(Person_id),
    CHECK(REGEXP_LIKE(Patient_id, '^PT-[0-9]{5}$'))
);

CREATE TABLE ALLERGENS (
	Allergen VARCHAR(50) PRIMARY KEY
);

INSERT INTO ALLERGENS (Allergen)
VALUES
	('Peanuts'),
    ('Tree-Nuts'),
    ('Dairy'),
    ('Eggs'),
    ('Shellfish'),
    ('Fish'),
    ('Soy'),
    ('Wheat'),
	('Sesame');


CREATE TABLE MEDICAL_RECORD (
    Record_id VARCHAR(10) PRIMARY KEY,
    Patient_id VARCHAR(10) NOT NULL,
    Employee_id VARCHAR(10) NOT NULL,
    Current_medications TEXT,
    Allergies VARCHAR(50),
    Treatment_history TEXT,
    Lab_results TEXT,
    Past_Diagnoses TEXT,
	FOREIGN KEY(Patient_id) REFERENCES PATIENT(Patient_id),
    FOREIGN KEY(Employee_id) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id)
);


CREATE TABLE INSURANCE_INFORMATION (
    Insurance_id VARCHAR(10) PRIMARY KEY,
    Patient_id VARCHAR(10),
    Amount DECIMAL(10, 2),
    Insurance_company VARCHAR(100),
    Patient_insurance VARCHAR(100),
	FOREIGN KEY(Patient_id) REFERENCES PATIENT(Patient_id)
);
CREATE TABLE BILLING (
    Billing_id VARCHAR(10) PRIMARY KEY,
    Patient_id VARCHAR(10),
    Insurance_id VARCHAR(10),
    Payment_method VARCHAR(50),
    Itemized_costs TEXT,
    Date DATE,
 	FOREIGN KEY(Patient_id) REFERENCES PATIENT(Patient_id),
    FOREIGN KEY(Insurance_id) REFERENCES INSURANCE_INFORMATION(Insurance_id)
);
CREATE TABLE APPOINTMENT (
    Appointment_id VARCHAR(10) PRIMARY KEY,
    Patient_id VARCHAR(10),
    Employee_id VARCHAR(10),
    Professional_id VARCHAR(10),
    Purpose VARCHAR(255),
    Date DATE,
    Time TIME,
    FOREIGN KEY(Patient_id) REFERENCES PATIENT(Patient_id),
    FOREIGN KEY(Employee_id) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id)
);
CREATE TABLE TREATMENT (
    Treatment_id VARCHAR(10) PRIMARY KEY,
    Recipient_id VARCHAR(10),
    Employee_id_prescriber VARCHAR(10),
    Employee_id_conductor VARCHAR(10),
    Outcome VARCHAR(255),
    End_date DATE,
    Start_date DATE,
    Description TEXT,
    Pharmacy VARCHAR(100),
	FOREIGN KEY(Recipient_id) REFERENCES PATIENT(Patient_id),
	FOREIGN KEY(Employee_id_prescriber) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id),
    FOREIGN KEY(Employee_id_conductor) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id),
    CHECK(Start_date < End_date)
);
CREATE TABLE DOCTOR (
    Employee_doctor_id VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY(Employee_doctor_id) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id)
);

CREATE TABLE TECHNICIAN (
    Employee_tech_id VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY(Employee_tech_id) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id)
);

CREATE TABLE NURSE (
    Employee_nurse_id VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY(Employee_nurse_id) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id)
);

CREATE TABLE ADMINISTRATIVE_STAFF (
    Employee_admin_id VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY(Employee_admin_id) REFERENCES HEALTHCARE_PROFESSIONAL(Employee_id)
);

