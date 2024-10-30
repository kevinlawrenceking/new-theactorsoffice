
<cftry>
    <cfset taoVersionService = new services.TaoVersionService()>
    <cfset taoVersionService.UPDtaoversions(
        verid = verid,
        new_major = new_major,
        new_minor = new_minor,
        new_patch = new_patch,
        new_versionstatus = new_versionstatus,
        new_versiontype = new_versiontype,
        new_version = new_version,
        new_build = new_build,
        new_reviewDate = new_reviewDate,
        new_releaseDate = new_releaseDate,
        new_reviewtime = new_reviewtime,
        new_releasetime = new_releasetime,
        new_hoursavail = numberFormat(new_hoursavail, "9.99")
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_322_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
