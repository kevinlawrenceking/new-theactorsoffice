
<cftry>
    <cfset variables.mediaService = createObject("component", "services.AuditionMediaService")>
    <cfset variables.mediaService.UPDaudmedia(mediaid=mediaid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_99_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the audmedia record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
