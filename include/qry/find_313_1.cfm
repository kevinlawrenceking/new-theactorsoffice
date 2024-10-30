
<cftry>
    <cfset find = createObject("component", "services.AuditionCategoryService").SELaudcategories_24375(audsubcatid=form.audsubcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_313_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
