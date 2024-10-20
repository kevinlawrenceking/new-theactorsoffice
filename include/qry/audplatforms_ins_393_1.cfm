
<cftry>
    <cfset result = createObject("component", "services.AuditionPlatformsService").insertaudplatforms(
        new_audplatform = new_audplatform,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audplatforms_ins_393_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
