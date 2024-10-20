
<cftry>
    <cfset result = createObject("component", "services.AuditionPlatformsService").updateaudplatforms(
        new_audplatform = new_audplatform,
        new_isDeleted = new_isDeleted,
        new_audplatformid = new_audplatformid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audplatforms_ins_395_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
