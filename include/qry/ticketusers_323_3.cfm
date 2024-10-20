
<cftry>
    <cfset ticketusers = createObject("component", "services.TicketTestUserService").getvm_tickettestusers_taousers(
        ticketid = results.recid, 
        currentUserid = session.userid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in ticketusers_323_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
