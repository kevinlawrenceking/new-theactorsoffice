
<cftry>
    <cfset getCategories = createObject("component", "services.AuditionCategoryService").getvm_audcategories_audsubcategories()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in getCategories_132_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
