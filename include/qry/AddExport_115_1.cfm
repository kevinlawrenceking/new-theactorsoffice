
<cftry>
    <cfset objExportService = createObject("component", "services.ExportService")>
    <cfset objExportService.INSexports(userid=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in AddExport_115_1.cfm]: #cfcatch.message#"/>
        <cfthrow message="Error occurred while calling INSexports function." detail="#cfcatch.detail#"/>
    </cfcatch>
</cftry>
