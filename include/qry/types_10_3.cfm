
<cftry>
    <cfset types = createObject("component", "services.UserService").getvm_taousers_tickets_shares_timezones()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in types_10_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
