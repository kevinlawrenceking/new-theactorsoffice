
<cftry>
    <cfset users = createObject("component", "services.UserService").getvm_taousers_tickets_shares_timezones()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in users_10_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
