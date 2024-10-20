
<cftry>
    <cfset statuses = createObject("component", "services.TicketStatusService").getticketstatuses()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_543_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
