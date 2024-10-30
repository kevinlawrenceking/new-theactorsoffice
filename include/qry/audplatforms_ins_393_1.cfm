
<cftry>
    <cfset variables.auditionPlatformsService = createObject("component", "services.AuditionPlatformsService")>
    <cfset variables.auditionPlatformsService.INSaudplatforms(new_audplatform=trim(new_audplatform), new_isDeleted=new_isDeleted)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audplatforms_ins_393_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudplatforms." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
