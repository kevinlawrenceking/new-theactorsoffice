
<cftry>
    <cfset find_subcat = createObject("component", "services.AuditionSubcategorieService").getAudSubcategories(
        new_audcatid = new_audcatid,
        audsubcatname = x.audsubcatname
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_subcat_308_18.cfm] #cfcatch.message#">
        <cfthrow message="Error fetching subcategory" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
