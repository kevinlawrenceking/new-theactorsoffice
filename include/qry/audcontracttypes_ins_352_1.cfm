
<cftry>
    <cfset componentPath = "/services/AuditionContractTypeService.cfc">
    <cfset contractService = createObject("component", componentPath)>
    <cfset contractService.insertAudContractTypes(
        new_contracttype = new_contracttype,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontracttypes_ins_352_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>

