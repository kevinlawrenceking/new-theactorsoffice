
<cftry>
    <cfset variables.auditionTypeService = new "/services/AuditionTypeService.cfc"()>
    <cfset variables.auditionTypeService.insertAudType(
        new_audtype = new_audtype,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtypes_ins_429_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while calling the insertAudType function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
