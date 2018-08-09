select cn.name area_of_origin,(select count(*) from openmrs.registration where area_of_origin=cn.name)as Patient_count 



from openmrs.concept_answer ca 
inner join openmrs.concept_name cn on cn.concept_id=ca.answer_concept and LOCALE_PREFERRED = 1 and voided=0 and locale='en'
where ca.concept_id=163 order by cn.name