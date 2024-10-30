
<cftry>
    <cfset find_subcat = createObject("component", "services.AuditionCategoryService").SELaudcategories_24367(audcatname=x.audcatname) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_subcat_308_16.cfm]: #cfcatch.message#" />
        <cfset find_subcat = queryNew("audsubcatid", "integer") />
    </cfcatch>
</cftry>
