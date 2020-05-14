
SELECT patient_id as 'Patient ID',Hepamud_ID,AGE,GENDER,visit_form_visit_date as 'Date of visit',type_of_visit as 'Type of visit',type_of_family_planning as'FP method' 
FROM openmrs.visit_form
where type_of_visit like'%FP%' and visit_form_visit_date >= "#startDate#" and visit_form_visit_date <= "#endDate#";

