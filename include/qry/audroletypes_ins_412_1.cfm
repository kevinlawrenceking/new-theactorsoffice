
<cftry>
    <cfset result = createObject("component", "services.AuditionRoleTypeService").insertaudroletypes(
        audroletype = new_audroletype,
        audCatid = new_audCatid,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audroletypes_ins_412_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
