SELECT ID.IDENTIFIER AS PATIENT_ID,ID2.IDENTIFIER AS Hepamud_ID ,UPPER(CONCAT(NM.GIVEN_NAME, ' ', NM.FAMILY_NAME)) AS PATIENT_NAME,PR.GENDER,
YEAR(PR.date_created) - YEAR(PR.BIRTHDATE) AS AGE,PA2.value AS Phone_Number,pa.date_created as Appointment_Date,Status 
FROM openmrs.patient_appointment pa 
INNER JOIN `openmrs`.`person` AS PR ON PR.PERSON_ID = pa.PATIENT_ID and PR.voided=0
INNER JOIN `openmrs`.`person_name` AS NM ON NM.PERSON_ID = pa.PATIENT_ID and NM.voided=0 and preferred=1
INNER JOIN `openmrs`.`patient_identifier` AS ID ON ID.PATIENT_ID = pa.PATIENT_ID AND ID.IDENTIFIER_TYPE = 3 and ID.voided=0 and ID.preferred=1
left JOIN `openmrs`.`patient_identifier` AS ID2 ON ID2.PATIENT_ID = pa.PATIENT_ID AND ID2.IDENTIFIER_TYPE = 4 and ID2.voided=0
left join openmrs.person_attribute PA2 on PA2.PERSON_ID = pa.PATIENT_ID and PA2.person_attribute_type_id=16
where pa.date_created=(select max(date_created) from openmrs.patient_appointment where patient_id=pa.patient_id) and status='Missed';
