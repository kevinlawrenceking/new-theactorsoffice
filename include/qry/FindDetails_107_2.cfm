
<cftry>
    <cfset variables.pageService = createObject("component", "services.PageService")>
    <cfset FindDetails = variables.pageService.getPgPages(compid=compid, pgid=pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindDetails_107_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
