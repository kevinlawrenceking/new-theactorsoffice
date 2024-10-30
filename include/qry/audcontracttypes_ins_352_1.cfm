
<cftry>
    <cfset componentPath = "/services/AuditionContractTypeService.cfc">
    <cfset auditionContractTypeService = createObject("component", componentPath)>
    <cfset auditionContractTypeService.INSaudcontracttypes(
        new_contracttype = new_contracttype,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontracttypes_ins_352_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling the INSaudcontracttypes function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
