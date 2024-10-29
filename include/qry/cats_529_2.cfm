
<cftry>
    <cfset cats = createObject("component", "services.AuditionCategoryService").getActiveAudCategories(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cats_529_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
