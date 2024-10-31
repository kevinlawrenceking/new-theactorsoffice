
<cftry>
    <cfset essenceService = createObject("component", "services.EssenceService")>
    <cfset essence_sel = essenceService.SELessences_24658(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in essence_sel_470_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
