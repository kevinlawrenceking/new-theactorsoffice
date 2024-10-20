
<cftry>
    <cfset categories = createObject("component", "services.AuditionCategoryService").getaudcategories()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in categories_524_11.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
