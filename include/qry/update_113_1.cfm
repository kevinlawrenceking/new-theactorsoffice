
<cftry>
    <cfset variables.siteLinkUserService = createObject("component", "/services/SiteLinkUserService")>
    <cfset variables.siteLinkUserService.UPDsitelinks_user_23883(new_id=new_id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_113_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
