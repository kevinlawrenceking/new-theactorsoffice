
<cftry>
    <cfset details = createObject("component", "services.TicketService").getVersionDetails(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_555_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
