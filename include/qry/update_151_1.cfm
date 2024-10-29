
<cftry>
    <cfset siteLinkUserService = createObject("component", "/services/SiteLinkUserService")>
    <cfset siteLinkUserService.updateSiteLinksUser(new_id=new_id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_151_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
