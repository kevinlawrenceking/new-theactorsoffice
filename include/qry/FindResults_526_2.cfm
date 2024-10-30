
<cftry>
    <cfset var pageService = createObject("component", "services.PageService")>
    <cfset FindResults = pageService.RESpgpages_24739(pgid=#pgid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindResults_526_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
