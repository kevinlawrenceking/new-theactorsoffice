
<cftry>
    <cfset getCategories = createObject("component", "services.AuditionCategoryService").SELaudcategories_23908()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in getCategories_132_2.cfm]: #cfcatch.message#">
        <cfset getCategories = queryNew("ID,NAME", "integer,varchar")>
    </cfcatch>
</cftry>
