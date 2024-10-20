
<cftry>
    <cfset taoVersionService = new "/services/TaoVersionService.cfc"()>
    <cfset old = taoVersionService.gettaoversions(old_verid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in old_312_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
