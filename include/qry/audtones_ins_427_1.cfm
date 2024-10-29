
<cftry>
    <cfset objAuditionTonesService = createObject("component", "services.AuditionTonesService")>
    <cfset objAuditionTonesService.updateAudtones(
        new_tone = new_tone,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_toneid = new_toneid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtones_ins_427_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
