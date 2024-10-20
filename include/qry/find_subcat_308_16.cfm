
<cftry>
    <cfset find_subcat = createObject("component", "/services/AuditionCategoryService").getvm_audcategories_audsubcategories(x.audcatname)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_subcat_308_16.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
