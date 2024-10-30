
<cftry>
    <cfset statuses = createObject("component", "services.TicketStatusService").SELticketstatuses_24766()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_543_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
