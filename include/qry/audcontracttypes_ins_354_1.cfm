
<cftry>
    <cfset componentPath = "/services/AuditionContractTypeService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset componentInstance.UPDaudcontracttypes(
        new_contracttype = new_contracttype, 
        new_audCatid = new_audCatid, 
        new_isDeleted = new_isDeleted, 
        new_contracttypeid = new_contracttypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontracttypes_ins_354_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
