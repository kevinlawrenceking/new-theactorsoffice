
<cftry>
    <cfset componentPath = "/services/AuditionMediaService.cfc">
    <cfset mediaService = createObject("component", componentPath)>
    <cfset result = mediaService.updateaudmedia(mediaid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_99_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
