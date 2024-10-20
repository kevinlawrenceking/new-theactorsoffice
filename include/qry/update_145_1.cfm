
<cftry>
    <cfset actionUserService = new "/services/ActionUserService.cfc"()>
    <cfset result = actionUserService.updateactionusers(new_id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_145_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
