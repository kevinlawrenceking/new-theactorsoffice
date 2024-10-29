
<cftry>
    <cfset variables.auditionLinkService = createObject("component", "/services/AuditionLinkService")>
    <cfset variables.auditionLinkService.updateAudlinksIsDeleted(linkid=#linkid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_details_238_1.cfm] #cfcatch.message#">
        <cfthrow message="Error updating audlinks" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
