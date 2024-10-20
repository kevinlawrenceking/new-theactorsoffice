
<cftry>
    <cfset taoVersionService = new "/services/TaoVersionService.cfc" />
    <cfset insertResult = taoVersionService.inserttaoversions(
        major = new_major,
        minor = new_minor,
        patch = new_patch,
        versionstatus = new_versionstatus,
        versiontype = new_versiontype,
        version = new_version,
        build = new_build,
        reviewDate = (new_reviewDate neq "") ? new_reviewDate : null,
        releaseDate = (new_releaseDate neq "") ? new_releaseDate : null,
        reviewtime = (new_reviewtime neq "") ? new_reviewtime : null,
        releasetime = (new_releasetime neq "") ? new_releasetime : null,
        hoursavail = (new_hoursavail neq "") ? numberformat(new_hoursavail, "9.99") : null
    ) />
<cfcatch type="any">
    <cfset errorLog("[Error in insert_320_2.cfm]: " & cfcatch.message) />
</cfcatch>
</cftry>

