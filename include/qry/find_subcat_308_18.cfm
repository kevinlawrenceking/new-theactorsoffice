
<cftry>
    <cfset find_subcat = createObject("component", "services.AuditionSubcategorieService").getaudsubcategories(new_audcatid, x.audsubcatname)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_subcat_308_18.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
