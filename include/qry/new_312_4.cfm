
<cftry>
    <cfset taoVersionService = new "/services/TaoVersionService.cfc"()>
    <cfset new = taoVersionService.gettaoversions(new_verid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in new_312_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
