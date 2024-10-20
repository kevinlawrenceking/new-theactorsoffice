
<cftry>
    <cfset result = createObject("component", "services.AuditionVocalTypeService").insertaudvocaltypes(
        vocaltype = new_vocaltype,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audvocaltypes_ins_437_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
