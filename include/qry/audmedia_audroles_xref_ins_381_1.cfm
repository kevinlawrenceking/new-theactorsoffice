
<cftry>
    <cfset componentPath = "/services/AuditionMediaAudRolesXRefService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset componentInstance.INSaudmedia_audroles_xref(
        new_mediaid = new_mediaid,
        new_audroleid = new_audroleid,
        new_mediaAudroleDescript = new_mediaAudroleDescript,
        new_isDeleted = new_isDeleted
    )>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audmedia_audroles_xref_ins_381_1.cfm]: #cfcatch.message#">
    <cfthrow message="Database error occurred." detail="#cfcatch.detail#">
</cfcatch>
</cftry>
