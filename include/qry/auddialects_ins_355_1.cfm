
<cftry>
    <cfset variables.auditionDialectService = createObject("component", "services.AuditionDialectService")>
    <cfset variables.auditionDialectService.insertAuddialect(
        new_auddialect = new_auddialect,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auddialects_ins_355_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAuddialect function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
