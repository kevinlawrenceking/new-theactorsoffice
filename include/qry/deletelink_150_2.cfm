
<cftry>
    <cfset linkService = new "/services/LinkService.cfc"()>
    <cfset linkService.updateLinkIsDeleted(linkid=linkid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in deletelink_150_2.cfm]: #cfcatch.message#">
        <cfthrow message="Function call failed" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
