
<cftry>
    <cfset siteLinkUserService = new "/services/SiteLinkUserService.cfc"()>
    <cfset siteLinkUserService.updatesitelinks_user(fileName, id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_92_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
