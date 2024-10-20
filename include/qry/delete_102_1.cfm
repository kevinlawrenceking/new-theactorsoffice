
<cftry>
    <cfset essenceService = new "/services/EssenceService.cfc"()>
    <cfset result = essenceService.updateessences(new_essenceid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in delete_102_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
