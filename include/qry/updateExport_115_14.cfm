
<cftry>
    <cfset exportService = createObject("component", "services.ExportService")>
    <cfset exportService.UPDexports(exportID=new_exportid, status="Active")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updateExport_115_14.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
