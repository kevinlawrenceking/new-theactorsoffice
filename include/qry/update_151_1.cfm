
<cftry>
    <cfset objSiteLinkUserService = createObject("component", "services.SiteLinkUserService")>
    <cfset objSiteLinkUserService.UPDsitelinks_user_23930(new_id=new_id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_151_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
