
<cftry>
    <cfset result = createObject("component", "services.AuditionTonesService").INSaudtones(
        new_tone = new_tone,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtones_ins_425_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudtones." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
