
<cftry>
    <cfset ticketme = createObject("component", "services.TicketTestUserService").getTicketTestUsers(
        recid = results.recid,
        userid = session.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ticketme_323_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
