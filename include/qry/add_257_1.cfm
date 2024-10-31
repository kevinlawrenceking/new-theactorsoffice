
<cftry>
    <cfset ticketService = createObject("component", "services.TicketService")>
    <cfset ticketService.INStickets(
        new_verid = new_verid,
        new_ticketName = new_ticketName,
        new_ticketdetails = new_ticketdetails,
        new_tickettype = new_tickettype,
        new_userid = new_userid,
        qstring = qstring
    )>
    <cfquery datasource="abod">
        UPDATE database_table SET isfetch = 1 WHERE condition
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_257_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
