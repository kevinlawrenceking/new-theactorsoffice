
<cftry>
    <cfset ticketTestUserService = new "/services/TicketTestUserService.cfc"()>
    <cfset ticketTestUserService.updatetickettestusers(
        teststatus = new_teststatus,
        rejectnotes = new_rejectnotes,
        id = testid
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
<cfcatch type="any">
    <cfset errorLog = "[Error in update_213_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
