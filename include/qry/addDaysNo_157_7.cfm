
<cftry>
    <cfset addDaysNo = createObject("component", "services.SystemService").getvm_fusystems_fuactions_actionusers(
        systemID = new_systemid,
        userID = new_userid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addDaysNo_157_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
