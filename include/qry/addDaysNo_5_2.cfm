
<cftry>
    <cfset addDaysNo = createObject("component", "services.SystemService").getvm_fusystems_fuactions_actionusers(new_systemid, session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in addDaysNo_5_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
