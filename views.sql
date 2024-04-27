
-- VIEW 1 : VIP PATIENT VIEW

DROP VIEW IF EXISTS VIP_Patient_View;
CREATE VIEW VIP_Patient_View AS
SELECT 
    P.FName AS First_Name,
    P.SName AS Last_Name,
    P.Patient_id,
    MIN(A.Date) AS Enrollment_Date
FROM 
    (SELECT 
        Patient_id,
        COUNT(*) AS Visits_Last_Month
    FROM 
        APPOINTMENT
    WHERE 
        Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
    GROUP BY 
        Patient_id
    HAVING 
        COUNT(*) > 3) AS VIP
JOIN 
    APPOINTMENT A ON VIP.Patient_id = A.Patient_id
JOIN 
    PATIENT P ON VIP.Patient_id = P.Patient_id
GROUP BY 
    VIP.Patient_id;

-- VIEW 2 : Preferred Healthcare Professional View

DROP VIEW IF EXISTS Preferred_Healthcare_Professional_View;
CREATE VIEW Preferred_Healthcare_Professional_View AS
SELECT 
    HP.Employee_id,
    HP.FName AS First_Name,
    HP.SName AS Last_Name,
    COUNT(AP.Appointment_id) AS Patient_Interaction_Count
FROM 
    HEALTHCARE_PROFESSIONAL HP
JOIN 
    APPOINTMENT AP ON HP.Employee_id = AP.Employee_id
WHERE 
    AP.Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 2 MONTH)
GROUP BY 
    HP.Employee_id
ORDER BY 
    Patient_Interaction_Count DESC;

-- View 3 : Critical Treatment View

DROP VIEW IF EXISTS Critical_Treatment_View ;

CREATE VIEW Critical_Treatment_View AS
SELECT 
    Treatment_id,
    Recipient_id AS Patient_id,
    Employee_id_prescriber AS Prescribing_Professional_id,
    Employee_id_conductor AS Conducting_Professional_id,
    Outcome,
    End_date,
    Start_date,
    Description,
    Pharmacy,
    COUNT(*) AS Treatment_Count
FROM 
    TREATMENT
WHERE 
    Start_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY 
    Treatment_id,
    Recipient_id,
    Employee_id_prescriber,
    Employee_id_conductor,
    Outcome,
    End_date,
    Start_date,
    Description,
    Pharmacy
HAVING 
    COUNT(*) > 5;

-- View 4 
DROP VIEW IF EXISTS Potential_VIP_Patient_View ;
CREATE VIEW Potential_VIP_Patient_View AS
SELECT
    P.Patient_id,
    CONCAT(P.FName, ' ', COALESCE(P.MName, ''), ' ', P.SName) AS Full_Name,
    COUNT(A.Appointment_id) AS Appointment_Count
FROM
    PATIENT P
JOIN
    APPOINTMENT A ON P.Patient_id = A.Patient_id
WHERE
    A.Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 2 MONTH)
GROUP BY
    P.Patient_id,
    Full_Name
HAVING
    Appointment_Count > 4;
    
-- vIEW 5
DROP VIEW IF EXISTS Top_Staff_View ;
CREATE VIEW Top_Staff_View AS
SELECT
    CONCAT(HP.FName, ' (', HP.Employee_id, ')') AS Staff_Name,
    'Healthcare Professional' AS Staff_Type,
    COUNT(*) AS Interaction_Count
FROM
    HEALTHCARE_PROFESSIONAL HP
JOIN
    APPOINTMENT A ON HP.Employee_id = A.Employee_id
WHERE
    A.Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY
    HP.Employee_id
UNION
SELECT
    CONCAT(HP.FName, ' (', HP.Employee_id, ')') AS Staff_Name,
    'Healthcare Professional' AS Staff_Type,
    COUNT(*) AS Interaction_Count
FROM
    HEALTHCARE_PROFESSIONAL HP
JOIN
    TREATMENT T ON HP.Employee_id = T.Employee_id_prescriber OR HP.Employee_id = T.Employee_id_conductor
WHERE
    T.Start_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY
    HP.Employee_id
ORDER BY
    Interaction_Count DESC
LIMIT 1;
