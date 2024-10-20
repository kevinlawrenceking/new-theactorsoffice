
<cftry>
    <cfset taoVersionService = new "/services/TaoVersionService.cfc"()>
    <cfset find = taoVersionService.gettaoversions(
        major = new_major, 
        minor = new_minor, 
        patch = new_patch, 
        version = new_version, 
        build = new_build
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_320_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
