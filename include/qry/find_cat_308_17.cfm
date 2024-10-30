
<cftry>
    <cfset find_cat = createObject("component", "services.AuditionCategoryService").SELaudcategories_24368(audcatname=x.audcatname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_cat_308_17.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving categories." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
