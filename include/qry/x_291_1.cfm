
<cftry>
    <cfset x = createObject("component", "services.UserService").getvm_taousers_tickets_shares_timezones()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_291_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
