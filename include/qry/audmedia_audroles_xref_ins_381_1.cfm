
<cftry>
    <cfset variables.auditionMediaAudRolesXRefService = createObject("component", "/services/AuditionMediaAudRolesXRefService")>
    <cfset variables.auditionMediaAudRolesXRefService.insertAudmediaAudrolesXref(
        new_mediaid = new_mediaid,
        new_audroleid = new_audroleid,
        new_mediaAudroleDescript = new_mediaAudroleDescript,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audmedia_audroles_xref_ins_381_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertAudmediaAudrolesXref." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
