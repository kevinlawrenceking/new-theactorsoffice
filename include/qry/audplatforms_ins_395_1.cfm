
<cftry>
    <cfset variables.auditionPlatformsService = createObject("component", "/services/AuditionPlatformsService")>
    <cfset variables.auditionPlatformsService.updateAudplatform(
        new_audplatform = new_audplatform, 
        new_isDeleted = new_isDeleted, 
        new_audplatformid = new_audplatformid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audplatforms_ins_395_1.cfm] #cfcatch.message#">
        <cfthrow message="Error updating audplatforms." detail="#cfcatch.message#">
    </cfcatch>
</cftry>
