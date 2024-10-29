
<cftry>
    <cfset componentPath = "/services/AuditionImportService">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.updateAuditionStatus(new_status=new_status, id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_308_10.cfm]: #cfcatch.message#">
        <cfthrow message="Error in update_308_10.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
