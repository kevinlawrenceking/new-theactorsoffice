
<cftry>
    <cfset result = createObject("component", "services.AuditionSubcategorieService").insertaudsubcategories(
        new_audSubCatName = new_audSubCatName,
        new_audCatId = new_audCatId,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audsubcategories_ins_421_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
