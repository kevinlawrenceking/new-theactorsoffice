
<cftry>
    <cfset ticketme = createObject("component", "services.TicketTestUserService").getvm_tickettestusers_taousers(results.recid, session.userid)>
<cfcatch>
    <cfset errorLog = "[Error in ticketme_323_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
