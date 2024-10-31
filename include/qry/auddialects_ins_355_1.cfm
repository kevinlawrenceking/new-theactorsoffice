
<cftry>
    <cfset variables.service = createObject("component", "/services/AuditionDialectService")>
    <cfset variables.service.INSauddialects(
        new_auddialect = new_auddialect,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auddialects_ins_355_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSauddialects function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
