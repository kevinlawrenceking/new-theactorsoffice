
<cftry>
    <cfset result = createObject("component", "/services/AuditionRoleTypeService").updateaudroletypes(
        new_audroletype = new_audroletype,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_audroletypeid = new_audroletypeid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audroletypes_ins_414_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
