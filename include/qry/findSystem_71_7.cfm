
<cftry>
    <cfset systemService = new "/services/SystemService.cfc"()>
    <cfset findSystem = systemService.getfusystems(systemtype="Maintenance List", systemscope=newsystemscope)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findSystem_71_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
