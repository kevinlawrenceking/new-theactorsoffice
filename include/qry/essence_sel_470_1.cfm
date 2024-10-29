
<cftry>
    <cfset essenceService = createObject("component", "services.EssenceService")>
    <cfset essence_sel = essenceService.getEssences(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in essence_sel_470_1.cfm]: #cfcatch.message#">
        <cfset essence_sel = queryNew("ID, NAME, userid")>
    </cfcatch>
</cftry>
