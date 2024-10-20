
<cftry>
    <cfset result = createObject("component", "services.AuditionTypeService").updateaudtypes(
        new_audtype = new_audtype,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_audtypeid = new_audtypeid
    ) />
    <cfset isfetch = 1 />
<cfcatch type="any">
    <cfset errorLog = "[Error in audtypes_ins_431_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
