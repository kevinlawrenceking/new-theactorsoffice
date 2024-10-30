
<cftry>
    <cfset variables.service = new "/services/AuditionQuestionTypeService.cfc"()>
    <cfset variables.service.INSaudqtypes(new_qtype=new_qtype, new_isDeleted=new_isDeleted)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audqtypes_ins_402_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
        <cfthrow message="Error in audqtypes_ins_402_1.cfm" detail="#cfcatch.message#">
    </cfcatch>
</cftry>
