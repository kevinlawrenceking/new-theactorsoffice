<cfset componentPath = "/services/AuditionContractTypeService">
<cfset auditionContractTypeService = createObject("component", componentPath)>
<cfset auditionContractTypeService.INSaudcontracttypes(
    new_contracttype = new_contracttype,
    new_audCatid = new_audCatid,
    new_isDeleted = new_isDeleted
)>