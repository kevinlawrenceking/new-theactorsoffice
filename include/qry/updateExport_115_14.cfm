
<cftry>
    <cfset result = new services.ExportService().updateexports(new_exportid, "Active")>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updateExport_115_14.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
