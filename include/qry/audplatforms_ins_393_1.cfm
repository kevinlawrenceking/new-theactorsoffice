
<cftry>
    <cfset variables.auditionPlatformsService = new "/services/AuditionPlatformsService.cfc"()>
    <cfset variables.auditionPlatformsService.insertAudPlatform(
        new_audplatform=trim(new_audplatform),
        new_isDeleted=new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audplatforms_ins_393_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAudPlatform." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
