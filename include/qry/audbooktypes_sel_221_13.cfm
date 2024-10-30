
<!--- This ColdFusion page retrieves active audio book types from the database. --->
<cftry>
    <cfset audbooktypes_sel = createObject("component", "services.AuditionBookTypeService").SELaudbooktypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audbooktypes_sel_221_13.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving audio book types." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
