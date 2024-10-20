
<cftry>
    <cfset statuses = createObject("component", "services.TicketStatusService").getvm_ticketstatuses_status_names()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in statuses_554_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
