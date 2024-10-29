
<cftry>
    <cfset componentPath = "/services/AuditionMediaXRefService.cfc">
    <cfset auditionMediaXRefService = createObject("component", componentPath)>
    <cfset auditionMediaXRefService.insertAudmediaAuditionsXref(new_mediaid=new_mediaid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in linkmedia_152_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAudmediaAuditionsXref." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
