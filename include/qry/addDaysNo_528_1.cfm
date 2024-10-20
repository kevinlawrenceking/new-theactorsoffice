
<cftry>
    <cfset addDaysNo = createObject("component", "services.SystemService").getvm_fusystems_fuactions_actionusers(systemID=systemid, userID=userid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in addDaysNo_528_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
