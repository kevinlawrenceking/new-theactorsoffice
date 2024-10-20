
<cftry>
    <cfset result = createObject("component", "services.AuditionTypeService").insertaudtypes(
        new_audtype = trim(new_audtype),
        new_audCatid = trim(new_audCatid),
        new_isDeleted = trim(new_isDeleted)
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audtypes_ins_429_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
