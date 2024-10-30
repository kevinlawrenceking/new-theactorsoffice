
<cftry>
    <cfset variables.auditionProjectService = createObject("component", "services.AuditionProjectService")>
    <cfset variables.auditionProjectService.INSaudprojects(
        new_projName = new_projName,
        new_projDescription = new_projDescription,
        new_audSubCatID = new_audSubCatID,
        new_isDeleted = new_isDeleted,
        isdirect = isdirect,
        new_contactid = new_contactid,
        new_projdate = new_projdate
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audprojects_ins_308_19.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
