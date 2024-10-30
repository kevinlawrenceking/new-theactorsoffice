
<cftry>
    <cfset categories = createObject("component", "services.AuditionCategoryService").SELaudcategories_24735(isDeleted=false) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in categories_524_11.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
