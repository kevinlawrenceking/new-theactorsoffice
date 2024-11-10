<cfset auditionCategoryService = createObject("component", "services.AuditionCategoryService")>
<cfset auditionCategoryService.INSaudcategories(
    new_audCatName = new_audCatName,
    new_isDeleted = new_isDeleted
)>