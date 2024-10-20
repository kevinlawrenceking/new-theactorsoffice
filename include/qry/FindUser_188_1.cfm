
<cftry>
    <cfset FindUser = createObject("component", "services.UserService").getvm_taousers_tickets_shares_timezones(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindUser_188_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
