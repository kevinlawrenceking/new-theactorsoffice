
<cftry>
    <cfset variables.auditionProjectService = createObject("component", "/services/AuditionProjectService")>
    <cfset variables.auditionProjectService.UPDaudprojects_24011(userid=userid, audprojectids=[/* array of project IDs */])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_191_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
