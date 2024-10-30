
<!--- This ColdFusion page retrieves active audio categories from the database for display. --->

<cftry>
    <cfset cats = createObject("component", "services.AuditionCategoryService").SELaudcategories_24744(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cats_529_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
