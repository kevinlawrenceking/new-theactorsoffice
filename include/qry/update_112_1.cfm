
<cftry>
    <cfset actionUserService = new "/services/ActionUserService.cfc" />
    <cfset actionUserService.updateactionusers(new_id) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_112_1.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
