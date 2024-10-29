
<!--- This ColdFusion page handles the insertion of user item types into the database. --->
<cftry>
    <cfset variables.itemTypesUserService = createObject("component", "services.ItemTypesUserService")>
    <cfset variables.itemTypesUserService.insertItemTypeUser(
        valuetype = x.valuetype,
        typeicon = x.typeicon,
        userid = users.userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_318_33.cfm]: #cfcatch.message#">
        <cfthrow message="Error in insert_318_33.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
