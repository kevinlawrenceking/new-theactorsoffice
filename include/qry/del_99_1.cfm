
<cftry>
    <cfset variables.auditionMediaService = createObject("component", "services.AuditionMediaService")>
    <cfset variables.auditionMediaService.updateAudmediaIsDeleted(mediaid=#mediaid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_99_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while calling updateAudmediaIsDeleted." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
