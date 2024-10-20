
<cftry>
    <cfset result = createObject("component", "services.AuditionCategoryService").insertaudcategories(
        new_audCatName = new_audCatName,
        new_isDeleted = new_isDeleted
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a mechanism to update the database status --->
<cfcatch type="any">
    <cfset errorLog = "[Error in audcategories_ins_345_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
