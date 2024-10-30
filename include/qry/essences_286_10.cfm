
<cftry>
    <cfset essencesService = createObject("component", "services.EssenceService")>
    <cfset essences = essencesService.SELessences_24270(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in essences_286_10.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
