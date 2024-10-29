
<cftry>
    <cfset versionService = createObject("component", "services.TaoVersionService")>
    <cfset find = versionService.getLatestVersion(datasource="yourDatasourceName")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_303_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
