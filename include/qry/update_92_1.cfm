
<cftry>
    <cfset siteLinkUserService = new services.SiteLinkUserService()>
    <cfset siteLinkUserService.UPDsitelinks_user(fileName="#fileName#", id="#id#")>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_92_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the site icon." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
