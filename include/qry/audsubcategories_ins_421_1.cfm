<cfset componentPath = "/services/AuditionSubcategorieService.cfc">
<cfset componentInstance = createObject("component", componentPath)>
<cfset componentInstance.INSaudsubcategories(
    new_audSubCatName = new_audSubCatName,
    new_audCatId = new_audCatId,
    new_isDeleted = new_isDeleted
)>