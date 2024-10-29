
<cftry>
    <cfset objService = createObject("component", "services.AuditionPlatformUserService")>
    <cfset objService.insertAudPlatformUser(CustomPlatform=CustomPlatform, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_28_11.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling insertAudPlatformUser function" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
