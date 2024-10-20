
<cftry>
    <cfset xs = createObject("component", "services.FUActionService").getfuactions()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in xs_318_22.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
