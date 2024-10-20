
<cftry>
    <cfset addDaysNo = new "/services/SystemService.cfc"().getvm_fusystems_fuactions_actionusers(
        systemID = maint_systemID,
        userID = userid
    )>
<cfcatch>
    <cfset errorLog = "[Error in addDaysNo_315_35.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
