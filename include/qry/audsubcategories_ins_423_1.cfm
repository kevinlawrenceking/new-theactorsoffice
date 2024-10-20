
<cftry>
    <cfset result = createObject("component", "services.AuditionSubcategorieService").updateaudsubcategories(
        new_audSubCatName = new_audSubCatName,
        new_audCatId = new_audCatId,
        new_isDeleted = new_isDeleted,
        new_audSubCatId = new_audSubCatId
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery>
        UPDATE your_table_name SET isfetch = 1 WHERE condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in audsubcategories_ins_423_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
