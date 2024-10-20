
<cftry>
    <cfset x = createObject("component", "/services/AllFieldsService").getallfields()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_292_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
