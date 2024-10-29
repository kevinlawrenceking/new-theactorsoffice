
<cftry>
    <cfset componentPath = "/services/AuditionDialectService.cfc">
    <cfset dialectService = createObject("component", componentPath)>
    <cfset dialectService.updateAuddialects(
        new_auddialect = trim(new_auddialect),
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_auddialectid = new_auddialectid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in auddialects_ins_357_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
