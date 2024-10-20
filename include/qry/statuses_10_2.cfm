
<cftry>
    <cfset statuses = createObject("component", "services.TicketService").getvm_ticket_statuses()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in statuses_10_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
