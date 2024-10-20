
<cftry>
    <cfset essenceService = new "/services/EssenceService.cfc"()>
    <cfset details = essenceService.getessences(essenceid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_263_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
