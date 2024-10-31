
<cftry>
    <cfset variables.service = createObject("component", "services.AuditionSubcategorieService")>
    <cfset variables.service.UPDaudsubcategories(
        new_audSubCatName = trim(new_audSubCatName),
        new_audCatId = new_audCatId,
        new_isDeleted = new_isDeleted,
        new_audSubCatId = new_audSubCatId
    )>
    <cfquery name="updateStatus" datasource="abod">
        UPDATE audsubcategories 
        SET isfetch = 1 
        WHERE audSubCatId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#new_audSubCatId#">
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audsubcategories_ins_423_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
