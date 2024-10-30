
<cftry>
    <cfset componentPath = "/services/AuditionMediaXRefService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset componentInstance.INSaudmedia_auditions_xref_24153(mediaid=mediaid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ins_252_2.cfm]: #cfcatch.message#">
        <cflog file="errorLog" text="Stack Trace: #cfcatch.stackTrace#">
        <cfthrow message="An error occurred while calling INSaudmedia_auditions_xref_24153." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
