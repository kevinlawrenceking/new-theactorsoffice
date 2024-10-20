
<cftry>
    <cfset variables.auditionMediaXRefService = createObject("component", "/services/AuditionMediaXRefService")>
    <cfset variables.result = variables.auditionMediaXRefService.deleteaudmedia_auditions_xref(mediaid=mediaid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in ins_252_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
