
<cftry>
    <cfset details = createObject("component", "services.TicketService").getTicketDetails(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_212_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
