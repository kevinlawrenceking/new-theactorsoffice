
<cftry>
    <cfset find = createObject("component", "services.TaoVersionService").getTAOVersions(
        new_major = new_major,
        new_minor = new_minor,
        new_patch = new_patch,
        new_version = new_version,
        new_build = new_build
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_320_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
