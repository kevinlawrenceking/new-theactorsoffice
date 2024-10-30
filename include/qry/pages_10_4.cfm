
<cftry>
    <cfset pagesService = createObject("component", "services.PageService")>
    <cfset pages = pagesService.SELpgpages(ticketActive="Y")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pages_10_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
