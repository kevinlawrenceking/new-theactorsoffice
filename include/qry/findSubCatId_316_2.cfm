
<cftry>
    <cfset findSubCatId = new services.AuditionCategoryService().getvm_audcategories_audsubcategories(audcatname, audsubcatname)>
<cfcatch type="any">
    <cfset errorLog = "[Error in findSubCatId_316_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
