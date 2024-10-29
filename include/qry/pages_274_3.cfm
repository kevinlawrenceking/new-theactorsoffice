
<cftry>
    <cfset pageService = createObject("component", "services.PageService")>
    <cfset pages = pageService.getActivePages(compactive="Y")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pages_274_3.cfm]: #cfcatch.message#">
        <cfset pages = queryNew("ID, name")>
    </cfcatch>
</cftry>
