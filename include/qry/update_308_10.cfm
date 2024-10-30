
<cftry>
    <cfset componentPath = "/services/AuditionImportService">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.UPDauditionsimport(new_status=new_status, id=y.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_308_10.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating audition status." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
