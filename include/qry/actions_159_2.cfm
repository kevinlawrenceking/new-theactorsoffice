
<cftry>
    <cfset actions = createObject("component", "services.SystemService").getvm_fusystems_fuactions_actionusers(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in actions_159_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
