<cfset componentPath = "/services/AuditionContractTypeService.cfc">
<cfset auditionContractTypeService = createObject("component", componentPath)>
<cfset auditionContractTypeService.INSaudcontracttypes(
    new_contracttype = new_contracttype,
    new_audCatid = new_audCatid,
    new_isDeleted = new_isDeleted
)>