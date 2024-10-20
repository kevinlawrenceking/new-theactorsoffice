
<cftry>
    <cfset result = createObject("component", "/services/AuditionQuestionTypeService").updateaudqtypes(
        new_qtype = new_qtype,
        new_isDeleted = new_isDeleted,
        new_qtypeid = new_qtypeid
    )>
    <cfquery name="updateFetchStatus">
        UPDATE databaseTable
        SET isfetch = 1
        WHERE condition = 'your_condition'
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in audqtypes_ins_404_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
