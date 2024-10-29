
<cftry>
    <cfset siteLinkUserService = createObject("component", "/services/SiteLinkUserService")>
    <cfset siteLinkUserService.updateSiteIcon(fileName=fileName, id=id)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_92_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the site icon." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
