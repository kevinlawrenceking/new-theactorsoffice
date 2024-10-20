
<cftry>
    <cfset result = new /services/AuditionQuestionTypeService().insertaudqtypes(
        qtype = new_qtype,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audqtypes_ins_402_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
