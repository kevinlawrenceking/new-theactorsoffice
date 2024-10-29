
<cftry>
    <cfset ticketService = new "/services/TicketService.cfc"()>
    <cfset ticketService.insertTicket(
        new_verid = new_verid,
        new_ticketName = new_ticketName,
        new_ticketdetails = new_ticketdetails,
        new_tickettype = new_tickettype,
        new_userid = new_userid,
        qstring = qstring
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_257_1.cfm] #cfcatch.message#">
        <cfthrow message="Error inserting ticket." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
