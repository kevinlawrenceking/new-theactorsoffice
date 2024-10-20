
<cftry>
    <cfset systems = createObject("component", "services.FUSystemTypeService").getfusystemtypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in systems_454_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
