
<cftry>
    <cfset siteLinkUserService = new "/services/SiteLinkUserService.cfc"()>
    <cfset siteLinkUserService.updatesitelinks_user(new_siteicon, id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_91_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
