
<cftry>
    <cfset objService = createObject("component", "services.AuditionMediaXRefService")>
    <cfset objService.DELaudmedia_auditions_xref(mediaid=mediaid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ins_252_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
