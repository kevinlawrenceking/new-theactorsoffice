
<cftry>
    <cfset details = createObject("component", "services.TicketService").getVersionDetails(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_556_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
