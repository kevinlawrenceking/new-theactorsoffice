<cfset service = createObject("component", "services.AuditionSubcategorieService")>
<cfset service.UPDaudsubcategories(
    new_audSubCatName = trim(new_audSubCatName),
    new_audCatId = new_audCatId,
    new_isDeleted = new_isDeleted,
    new_audSubCatId = new_audSubCatId
)>
<cfquery result="result"  name="updateStatus" datasource="abod">
    UPDATE audsubcategories 
    SET isfetch = 1 
    WHERE audSubCatId = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#new_audSubCatId#">
</cfquery>