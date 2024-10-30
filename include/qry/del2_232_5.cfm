
<cftry>
    <cfset objAuditionProjectService = createObject("component", "/services/AuditionProjectService")>
    <cfset objAuditionProjectService.UPDaudprojects_24125(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del2_232_5.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
