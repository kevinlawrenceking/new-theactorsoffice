
<cftry>
    <cfset Systems = createObject("component", "services.SystemService").getfusystems()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Systems_540_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
