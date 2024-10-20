
<cftry>
    <cfset essenceService = createObject("component", "/services/EssenceService")>
    <cfset findit = essenceService.getessences(new_essence, userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_287_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
