
<cftry>
    <cfset variables.auditionMediaAudRolesXRefService = createObject("component", "/services/AuditionMediaAudRolesXRefService")>
    <cfset variables.auditionMediaAudRolesXRefService.updateAudmediaAudrolesXref(
        new_mediaid=new_mediaid,
        new_audroleid=new_audroleid,
        new_mediaAudroleDescript=new_mediaAudroleDescript,
        new_isDeleted=new_isDeleted,
        conditionColumn="yourConditionColumn",
        conditionValue="yourConditionValue"
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audmedia_audroles_xref_ins_382_1.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
