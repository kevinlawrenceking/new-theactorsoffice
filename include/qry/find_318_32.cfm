
<cftry>
    <cfset find = createObject("component", "services.ItemTypesUserService").getItemTypesByUser(
        valuetype = x.valuetype,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_32.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
