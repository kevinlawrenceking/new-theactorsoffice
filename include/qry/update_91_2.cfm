
<cftry>
    <cfset siteLinkUserService = new "/services/SiteLinkUserService.cfc"()>
    <cfset siteLinkUserService.UPDsitelinks_user_23854(new_siteicon=new_siteicon, id=id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_91_2.cfm] #cfcatch.message#"/>
        <cfthrow message="An error occurred while updating the site icon." detail="#cfcatch.detail#"/>
    </cfcatch>
</cftry>
