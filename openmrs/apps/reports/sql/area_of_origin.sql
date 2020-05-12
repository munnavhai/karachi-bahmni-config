SELECT `registration`.`Registration_Date`,
    `registration`.`PATIENT_ID`,
    `registration`.`Hepamud_ID`,
    `registration`.`PATIENT_NAME`,
    `registration`.`GENDER`,
    `registration`.`AGE`,
    `registration`.`area_of_origin`,
    `registration`.`origin_details`
FROM `openmrs`.`registration`
 where Registration_Date >= "#startDate#" and Registration_Date <= "#endDate#"