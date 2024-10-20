
<cftry>
    <cfset result = createObject("component", "services.AuditionDialectService").updateauddialects(
        auddialectid = new_auddialectid,
        auddialect = new_auddialect,
        audCatid = new_audCatid,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auddialects_ins_357_1.cfm]: #cfcatch.message# Details: #cfcatch.detail#">
    </cfcatch>
</cftry>

