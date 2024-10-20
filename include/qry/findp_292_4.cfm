
<cftry>
    <cfset findp = createObject("component", "services.AllFieldsService").getallfields()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findp_292_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
