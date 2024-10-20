
<cftry>
    <cfset essenceService = new "/services/EssenceService.cfc"()>
    <cfset essence_sel = essenceService.getessences(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in essence_sel_470_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
