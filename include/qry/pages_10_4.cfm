
<cftry>
    <cfset pages = createObject("component", "services.PageService").getActivePgPages(ticketActive="Y")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in pages_10_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
