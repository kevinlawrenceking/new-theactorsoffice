
<cftry>
    <cfset find = createObject("component", "services.AuditionCategoryService").getCategoryAndSubcategory(audsubcatid=form.audsubcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_313_1.cfm]: #cfcatch.message#">
        <cfset find = QueryNew("category, subcategory")>
    </cfcatch>
</cftry>
