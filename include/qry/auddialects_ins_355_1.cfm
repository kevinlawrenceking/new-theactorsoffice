
<cftry>
    <cfset result = createObject("component", "services.AuditionDialectService").insertauddialects(
        auddialect = new_auddialect,
        audCatid = new_audCatid,
        isDeleted = new_isDeleted
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in auddialects_ins_355_1.cfm] #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
