
<cftry>
    <cfset linkService = new "/services/LinkService.cfc"()>
    <cfset linkService.updatelinks(linkid=linkid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in deletelink_150_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
