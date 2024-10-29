
<cftry>
    <cfset categories = createObject("component", "/services/AuditionCategoryService").getAudCategories(false) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in categories_524_11.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
