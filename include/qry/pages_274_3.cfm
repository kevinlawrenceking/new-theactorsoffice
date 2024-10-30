
<cftry>
    <cfset pagesService = createObject("component", "services.PageService")>
    <cfset pages = pagesService.SELpgpages_24210(compactive="Y")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pages_274_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
