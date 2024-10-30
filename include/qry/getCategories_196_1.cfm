
<cftry>
    <cfset getCategories = createObject("component", "services.AuditionCategoryService").SELaudcategories_24033(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in getCategories_196_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
