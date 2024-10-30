
<cftry>
    <cfset audsourcesService = createObject("component", "services.AuditionSourceService")>
    <cfset audsources = audsourcesService.SELaudsources_24222(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsources_281_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
