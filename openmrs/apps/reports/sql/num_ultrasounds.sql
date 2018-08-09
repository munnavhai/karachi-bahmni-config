select * from openmrs.visit_form where Ultrasound_performed= 'true' and (visit_form_visit_date >= "#startDate#" and visit_form_visit_date <= "#endDate#");
