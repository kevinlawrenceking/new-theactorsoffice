
<cftry>
    <cfset k = createObject("component", "services.SystemUserService").getvm_fusystemusers_funotifications_actionusers(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in k_195_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
