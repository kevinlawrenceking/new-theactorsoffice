
<cftry>
    <cfset findSubCatId = createObject("component", "services.AuditionCategoryService").SELaudcategories_24389(audcatname="#audcatname#", audsubcatname="#audsubcatname#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findSubCatId_316_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the data. Please check the logs for more details." type="DatabaseQueryError">
    </cfcatch>
</cftry>
