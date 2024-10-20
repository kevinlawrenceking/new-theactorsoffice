
<cftry>
    <cfset getCategories = createObject("component", "services.AuditionCategoryService").getaudcategories()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in getCategories_196_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
