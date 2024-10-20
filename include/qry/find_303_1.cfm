
<cftry>
    <cfset taoVersionService = new services.TaoVersionService()>
    <cfset find = taoVersionService.gettaoversions()>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_303_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
