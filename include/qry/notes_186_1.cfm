
<cftry>
    <cfset notes = createObject("component", "/services/TicketService").getvm_tickets_users_pages(recid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notes_186_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
