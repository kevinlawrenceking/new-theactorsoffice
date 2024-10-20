
<cftry>
    <cfset essences = createObject("component", "services.EssenceService").getessences(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in essences_286_10.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
