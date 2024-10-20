
<cftry>
    <cfset action_user = createObject("component", "/services/SystemService").getvm_fusystems_fuactions_actionusers(
        systemID = mysystems.systemid,
        userID = session.userid
    )>
<cfcatch>
    <cfset errorLog = "[Error in action_user_295_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
