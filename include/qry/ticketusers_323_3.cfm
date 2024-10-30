
<cftry>
    <cfset ticketTestUserService = createObject("component", "services.TicketTestUserService")>
    <cfset ticketusers = ticketTestUserService.SELtickettestusers_24474(ticketId=results.recid, userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ticketusers_323_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
