
<cftry>
    <cfset variables.auditionQuestionTypeService = createObject("component", "/services/AuditionQuestionTypeService")>
    <cfset variables.auditionQuestionTypeService.UPDaudqtypes(
        new_qtype = new_qtype,
        new_isDeleted = new_isDeleted,
        new_qtypeid = new_qtypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audqtypes_ins_404_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating audqtypes." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
