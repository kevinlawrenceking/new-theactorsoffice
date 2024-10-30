
<!--- This ColdFusion page retrieves a specific subcategory from the audsubcategories table based on the category ID and subcategory name. --->

<cftry>
    <cfset find_subcat = createObject("component", "services.AuditionSubcategorieService").SELaudsubcategories(
        new_audcatid = new_audcatid,
        audsubcatname = x.audsubcatname
    )>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_subcat_308_18.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while fetching subcategory." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
