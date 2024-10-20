
<cftry>
    <cfset essenceService = new "/services/EssenceService.cfc"()>
    <cfset result = essenceService.updateessences(new_essenceName, isdeleted, essenceid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_264_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
