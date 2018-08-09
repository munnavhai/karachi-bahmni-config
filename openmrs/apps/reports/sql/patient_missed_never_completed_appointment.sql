SELECT ID.IDENTIFIER AS PATIENT_ID,ID2.IDENTIFIER AS Hepamud_ID ,UPPER(CONCAT(NM.GIVEN_NAME, ' ', NM.FAMILY_NAME)) AS PATIENT_NAME,PR.GENDER,
YEAR(curdate()) - YEAR(PR.BIRTHDATE) AS AGE,
PA2.value AS phone_number
FROM
 `openmrs`.`patient` AS PT 
INNER JOIN `openmrs`.`person` AS PR ON PR.PERSON_ID = PT.PATIENT_ID and PR.voided=0
INNER JOIN `openmrs`.`person_name` AS NM ON NM.PERSON_ID = PT.PATIENT_ID and NM.voided=0 and preferred=1
left join openmrs.person_attribute PA2 on PA2.PERSON_ID = PT.PATIENT_ID and PA2.person_attribute_type_id=16
INNER JOIN `openmrs`.`patient_identifier` AS ID ON ID.PATIENT_ID = PT.PATIENT_ID AND ID.IDENTIFIER_TYPE = 3 and ID.voided=0 and ID.preferred=1
left JOIN `openmrs`.`patient_identifier` AS ID2 ON ID2.PATIENT_ID = PT.PATIENT_ID AND ID2.IDENTIFIER_TYPE = 4 and ID2.voided=0
where PT.patient_id in (select patient_id from openmrs.patient_appointment where status='missed') 
and PT.patient_id not in (select patient_id from openmrs.patient_appointment where status='Completed' or status='Scheduled')
