
<cftry>
    <cfset variables.linkService = createObject("component", "services.LinkService")>
    <cfset variables.linkService.UPDlinks(linkid=linkid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in deletelink_150_2.cfm]: #cfcatch.message#">
        <cfthrow message="Function call failed" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
