
<cftry>
    <cfset audlinksService = new "/services/AuditionLinkService.cfc"()>
    <cfset audlinks = audlinksService.getAudlinksByRoleId(audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in audlinks_44_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
