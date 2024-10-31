
<cftry>
    <cfset variables.auditionTypeService = createObject("component", "services.AuditionTypeService")>
    <cfset variables.auditionTypeService.INSaudtypes(
        new_audtype=new_audtype,
        new_audCatid=new_audCatid,
        new_isDeleted=new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtypes_ins_429_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
