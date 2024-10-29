
<cftry>
    <cfset objService = createObject("component", "/services/AuditionMediaXRefService")>
    <cfset objService.deleteAudMediaAuditionsXref(mediaid=mediaid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ins_252_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
