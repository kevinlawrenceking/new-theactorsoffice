
<cftry>
    <cfset variables.auditionQuestionTypeService = new "/services/AuditionQuestionTypeService.cfc"()>
    <cfset variables.auditionQuestionTypeService.updateAudQTypes(
        new_qtype = new_qtype,
        new_isDeleted = new_isDeleted,
        new_qtypeid = new_qtypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audqtypes_ins_404_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating audqtypes." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
