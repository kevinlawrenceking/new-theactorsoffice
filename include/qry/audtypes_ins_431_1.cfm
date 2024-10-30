
<cftry>
    <cfset variables.auditionTypeService = new "/services/AuditionTypeService.cfc"()>
    <cfset variables.auditionTypeService.UPDaudtypes(
        new_audtype = trim(new_audtype),
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_audtypeid = new_audtypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtypes_ins_431_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.message#">
    </cfcatch>
</cftry>
