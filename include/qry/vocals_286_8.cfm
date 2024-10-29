
<cftry>
    <cfset vocalsService = createObject("component", "/services/AuditionVocalTypeService")>
    <cfset vocals = vocalsService.getVocalTypes(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vocals_286_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
