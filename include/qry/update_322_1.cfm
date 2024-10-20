
<cftry>
    <cfset taoVersionService = new "/services/TaoVersionService.cfc"()>
    <cfset taoVersionService.updatetaoversions(
        new_major = new_major,
        new_minor = new_minor,
        new_patch = new_patch,
        new_versionstatus = new_versionstatus,
        new_versiontype = new_versiontype,
        new_version = new_version,
        new_build = new_build,
        verid = verid,
        new_reviewDate = (new_reviewDate neq "") ? new_reviewDate : null,
        new_releaseDate = (new_releaseDate neq "") ? new_releaseDate : null,
        new_reviewtime = (new_reviewtime neq "") ? new_reviewtime : null,
        new_releasetime = (new_releasetime neq "") ? new_releasetime : null,
        new_hoursavail = (new_hoursavail neq "") ? numberformat(new_hoursavail, "9.99") : null
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog("[Error in update_322_1.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
