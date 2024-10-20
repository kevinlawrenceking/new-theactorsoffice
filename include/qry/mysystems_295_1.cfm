
<cftry>
    <cfset mysystems = createObject("component", "services.SystemService").getfusystems()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in mysystems_295_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
