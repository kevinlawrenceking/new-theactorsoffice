
<cftry>
    <cfset getCategories = createObject("component", "services.AuditionCategoryService").getAudCategories(false) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in getCategories_196_1.cfm]: #cfcatch.message#" />
        <cfset getCategories = queryNew("audcatid,audcatname", "integer,varchar") />
    </cfcatch>
</cftry>
