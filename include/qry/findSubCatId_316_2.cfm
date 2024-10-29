
<cftry>
    <cfset findSubCatId = createObject("component", "services.AuditionCategoryService").getNewAudSubCatId(audcatname="#audcatname#", audsubcatname="#audsubcatname#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findSubCatId_316_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the subcategory ID. Please check the logs for more details." type="FetchError">
    </cfcatch>
</cftry>
