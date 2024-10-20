
<cftry>
    <cfset cats = createObject("component", "services.AuditionCategoryService").getaudcategories()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in cats_529_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
