
<cftry>
    <cfset find = createObject("component", "services.ItemTypesUserService").getItemTypesByUser(
        valuetype = x.valuetype,
        userid = select_userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in find_318_35.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching item types." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
