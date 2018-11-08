Bahmni.ConceptSet.FormConditions.rules = {
    'Diastolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    },
    'Systolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    },
	
	
	   
	  'Type of visit': function(formName, formFieldValues) {
		var conditions = {enable: [], disable: []};
		var selectedValues = formFieldValues['Type of visit'];
		
		var found = _.includes(selectedValues, "Initial Consultation") || _.includes(selectedValues, "Treatment initiation")
		|| _.includes(selectedValues, "Follow-up visit")
		if(found) {
			conditions.enable.push("Ultrasound performed")
			conditions.enable.push("Treatment Regimen")
		} else {
			conditions.disable.push("Ultrasound performed")
			conditions.disable.push("Treatment Regimen")
		}
		
		var found = _.includes(selectedValues, "Initial Consultation") || _.includes(selectedValues, "Treatment initiation")
		|| _.includes(selectedValues, "Follow-up visit") || _.includes(selectedValues, "Lab Test")
		if(found) {
			conditions.enable.push("Lab test performed")
		} else {
			conditions.disable.push("Lab test performed")
		}
		
		var found = _.includes(selectedValues, "Initial Consultation") || _.includes(selectedValues, "Treatment initiation")
		|| _.includes(selectedValues, "Follow-up visit") || _.includes(selectedValues, "Lab Test") 
		|| _.includes(selectedValues, "Vaccination")
		if(found) {
			conditions.enable.push("Vaccine given")
		} else {
			conditions.disable.push("Vaccine given")
		}
		
		var found = _.includes(selectedValues,"Patient Support")
		if(found) {
			conditions.enable.push("Type of patient support session")
		} else {
			conditions.disable.push("Type of patient support session")
		}
		
		return conditions;
	  },
	  
	  'Lab test performed': function(formName, formFieldValues) {
			
			var conditions = {enable: [], disable: []};
			var selectedValues = formFieldValues['Lab test performed'];
		
			var found = _.includes(selectedValues,"Other")
			if(found) {
				conditions.enable.push("Specify lab test")
			} else {
				conditions.disable.push("Specify lab test")
			}
		
		return conditions;
		
	  }
};