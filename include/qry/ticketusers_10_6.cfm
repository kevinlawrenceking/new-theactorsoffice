
<cftry>
    <cfset ticketusers = createObject("component", "services.UserService").getvm_taousers_tickets_shares_timezones(results.recid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in ticketusers_10_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
