
<cftry>
    <cfset pageService = createObject("component", "services.PageService")>
    <cfset FindResults = pageService.getDynamicQueryResults(pgid=pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindResults_466_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
