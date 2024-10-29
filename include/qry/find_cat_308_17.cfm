
<cftry>
    <cfset find_cat = createObject("component", "services.AuditionCategoryService").getAudCategories(audcatname=x.audcatname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_cat_308_17.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching categories." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
