
<cftry>
    <cfset action_user_del = createObject("component", "services.SystemService").getvm_fusystems_fuactions_actionusers(
        systemID = mysystems.systemid,
        userID = session.userid
    )>
<cfcatch>
    <cfset errorLog = "[Error in action_user_del_295_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
