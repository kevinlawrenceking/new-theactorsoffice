
<cftry>
    <cfset objService = createObject("component", "services.AuditionMediaXRefService")>
    <cfset objService.insertAudmediaAuditionsXref(mediaid=mediaid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ins_252_2.cfm]: #cfcatch.message#">
        <cflog file="errorLog" text="Stack Trace: #cfcatch.stackTrace#">
        <cfthrow message="An error occurred while calling insertAudmediaAuditionsXref." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
