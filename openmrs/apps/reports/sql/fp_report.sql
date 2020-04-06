SELECT patient_id,AGE,visit_form_visit_date as 'Date of visit',type_of_visit as 'type of visit',type_of_family_planning as'FP method' 
FROM openmrs.visit_form
where type_of_visit like'%FP%';