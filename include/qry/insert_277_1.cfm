
<cftry>
    <cfset objService = createObject("component", "services.AuditionToneUserService")>
    <cfset objService.INSaudtones_user(tone="#Custom#", audcatid=#audcatid#, userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_277_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error in insert_277_1.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
