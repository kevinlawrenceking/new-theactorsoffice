
<cftry>
    <cfset findcat = createObject("component", "services.AuditionCategoryService").SELaudcategories_24357(audcatname=y.audcatname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findcat_308_6.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the category ID.">
    </cfcatch>
</cftry>
