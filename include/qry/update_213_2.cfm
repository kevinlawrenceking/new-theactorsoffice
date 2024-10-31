
<cftry>
    <cfset ticketTestUserService = createObject("component", "services.TicketTestUserService")>
    <cfset ticketTestUserService.UPDtickettestusers(
        new_teststatus = new_teststatus,
        new_rejectnotes = new_rejectnotes,
        testid = testid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_213_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the ticket test users." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
