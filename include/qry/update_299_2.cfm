
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset ticketService.UPDtickets_24335(
        ticketId = recid,
        userFirstName = uu.userfirstname,
        userLastName = uu.userlastname
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_299_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
