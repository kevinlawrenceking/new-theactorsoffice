
<cftry>
    <cfset importsService = createObject("component", "/services/ContactImportService")>
    <cfset imports = importsService.getUploadData(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in imports_485_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
