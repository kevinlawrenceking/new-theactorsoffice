
<cftry>
    <cfset componentPath = "/services/AuditionImportService.cfc">
    <cfset auditionService = createObject("component", componentPath)>
    <cfset auditionService.insertAuditionsImport(
        importdata = importdata,
        new_audsubcatid = new_audsubcatid,
        new_uploadid = new_uploadid
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in find_316_3.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
