
<cftry>
    <cfset actiondetails = createObject("component", "services.SystemService").getfusystems(id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in actiondetails_194_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
