
<cftry>
    <cfset result = createObject("component", "/services/AuditionTonesService").updateaudtones(
        new_tone = new_tone,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_toneid = new_toneid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audtones_ins_427_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
