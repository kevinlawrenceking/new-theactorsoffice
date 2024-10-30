
<cftry>
    <cfset find = createObject("component", "services.TaoVersionService").SELtaoversions_24469(
        new_major = new_major,
        new_minor = new_minor,
        new_patch = new_patch,
        new_version = new_version,
        new_build = new_build
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_320_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving TAO versions." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
