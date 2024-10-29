
<cftry>
    <cfset variables.auditionContractTypeService = createObject("component", "/services/AuditionContractTypeService")>
    <cfset variables.auditionContractTypeService.updateAudContractTypes(
        new_contracttype=new_contracttype, 
        new_audCatid=new_audCatid, 
        new_isDeleted=new_isDeleted, 
        new_contracttypeid=new_contracttypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcontracttypes_ins_354_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the contract types." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
