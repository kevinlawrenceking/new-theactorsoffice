
<cftry>
    <cfset siteLinkUserService = createObject("component", "/services/SiteLinkUserService")>
    <cfset siteLinkUserService.updateSitelinksUserTbl(new_id=new_id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_113_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling the update function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
