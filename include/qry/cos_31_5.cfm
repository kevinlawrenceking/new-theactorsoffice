
<cftry>
    <cfset auditionProjectService = new "/services/AuditionProjectService.cfc"()>
    <cfset cos = auditionProjectService.getvm_audprojects_roles_events(userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in cos_31_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
