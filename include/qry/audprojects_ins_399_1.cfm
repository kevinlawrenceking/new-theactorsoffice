<cfset auditionProjectService = createObject("component", "services.AuditionProjectService")>
<cfset new_audprojectID = auditionProjectService.INSaudprojects_24585(
    new_projName = new_projName,
    new_projDescription = new_projDescription,
    new_userid = new_userid,

    new_audSubCatID = new_audSubCatID,
    new_unionID = new_unionID,
    new_networkID = new_networkID,
    new_toneID = new_toneID,
    new_contractTypeID = new_contractTypeID,
    new_isDeleted = new_isDeleted,
    isdirect = isdirect
     <cfif structKeyExists(variables, "new_contactid") and isnumeric(new_contactid)> ,new_contactid = new_contactid</cfif>
    
    
    ) />