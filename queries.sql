-- List all healthcare professionals by their specialization.
SELECT Specialization, FName, MName, SName
FROM HEALTHCARE_PROFESSIONAL
JOIN PERSON ON HEALTHCARE_PROFESSIONAL.Person_id = PERSON.Person_id;

-- Find the names of healthcare professionals who are also registered patients.
SELECT P.FName, P.MName, P.SName
FROM PERSON AS P
INNER JOIN HEALTHCARE_PROFESSIONAL AS HP ON P.Person_id = HP.Person_id
INNER JOIN PATIENT AS PT ON P.Person_id = PT.Person_id;

-- Calculate the average number of visits by the top five VIP patients.
SELECT AVG(Visits_Last_Month) AS Top_Five_Visits_Average
FROM (
    SELECT COUNT(*) AS Visits_Last_Month
    FROM APPOINTMENT
    WHERE Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
    AND Patient_id IN (
        SELECT Patient_id
        FROM (
            SELECT Patient_id, ROW_NUMBER() OVER (ORDER BY Enrollment_Date ASC) AS row_num
            FROM VIP_Patient_View
        ) AS ranked_patients
        WHERE row_num <= 5
    )
    GROUP BY Patient_id
) AS Top_Five_Visits_Average;

-- Determine the medication with the highest number of prescriptions in the past month.
SELECT COUNT(*) AS Prescription_Count, Description AS Medication
FROM TREATMENT
WHERE Start_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY Description
ORDER BY Prescription_Count DESC
LIMIT 1;

-- Summarize the total number of treatments administered by each department.
SELECT
    HP.Department,
    COUNT(T.Treatment_id) AS Total_Treatments
FROM
    TREATMENT T
JOIN
    HEALTHCARE_PROFESSIONAL HP ON T.Employee_id_conductor = HP.Employee_id
GROUP BY
    HP.Department;

-- Obtain details of healthcare professionals who have worked every day for the past week.
SELECT
    HP.Employee_id,
    PN.FName AS First_Name,
    PN.SName AS Last_Name
FROM
    HEALTHCARE_PROFESSIONAL HP
JOIN
    PERSON PN ON HP.Person_id = PN.Person_id
JOIN
    APPOINTMENT A ON HP.Employee_id = A.Employee_id
WHERE
    A.Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 WEEK)
GROUP BY
    HP.Employee_id, PN.FName, PN.SName
HAVING
    COUNT(DISTINCT DATE(A.Date)) = 7;

-- Count the number of patients seen by the most popular healthcare professional.
SELECT
    COUNT(DISTINCT AP.Patient_id) AS Patients_Seen_By_Most_Popular
FROM
    APPOINTMENT AP
JOIN
    Preferred_Healthcare_Professional_View PH ON AP.Employee_id = PH.Employee_id
WHERE
    PH.Patient_Interaction_Count = (
        SELECT MAX(Patient_Interaction_Count)
        FROM Preferred_Healthcare_Professional_View
);

-- Retrieve all medical records created after the most recent healthcare professional was hired.
SELECT *
FROM MEDICAL_RECORD
WHERE DATE(Record_creation_date) > (
    SELECT MAX(Employee_hire_date)
    FROM (
        SELECT MAX(Record_creation_date) AS Employee_hire_date
        FROM HEALTHCARE_PROFESSIONAL
    ) AS Latest_Hire
);

-- List all staff who have been registered as VIP patients within a month of their employment.


-- Identify the department with the highest number of unique patient visits.
SELECT
    HP.Department,
    COUNT(DISTINCT AP.Patient_id) AS Unique_Patient_Visits
FROM
    APPOINTMENT AP
JOIN
    HEALTHCARE_PROFESSIONAL HP ON AP.Employee_id = HP.Employee_id
GROUP BY
    HP.Department
ORDER BY
    Unique_Patient_Visits DESC
LIMIT 1;

-- Find the names of patients who have maintained VIP status for over 5 years.
SELECT 
    PN.FName AS First_Name,
    PN.SName AS Last_Name,
    P.Patient_id,
    MIN(A.Date) AS Enrollment_Date
FROM 
    (SELECT 
        Patient_id,
        COUNT(*) AS Visits_Last_Month
    FROM 
        APPOINTMENT
    WHERE 
        Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 60 MONTH)
    GROUP BY 
        Patient_id
    HAVING 
        COUNT(*) > 180) AS VIP
JOIN 
    APPOINTMENT A ON VIP.Patient_id = A.Patient_id
JOIN 
    PATIENT P ON VIP.Patient_id = P.Patient_id
JOIN 
    PERSON PN ON P.Person_id = PN.Person_id
GROUP BY 
    P.Patient_id;

-- Retrieve all appointment details made by potential VIP patients in the last year.
SELECT
    P.Patient_id,
    CONCAT(PN.FName, ' ', COALESCE(PN.MName, ''), ' ', PN.SName) AS Full_Name,
    COUNT(A.Appointment_id) AS Appointment_Count
FROM
    PATIENT P
JOIN
    APPOINTMENT A ON P.Patient_id = A.Patient_id
JOIN 
    PERSON PN ON P.Person_id = PN.Person_id
WHERE
    A.Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)
GROUP BY
    P.Patient_id,
    Full_Name
HAVING
    Appointment_Count > 24 AND Appointment_Count < 36;