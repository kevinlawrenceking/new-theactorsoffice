<cfset auditionCategoryService = createObject("component", "services.AuditionCategoryService")>
<cfset getCategories = auditionCategoryService.SELaudcategories_24033(isDeleted=false)>