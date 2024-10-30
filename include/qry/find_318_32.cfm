
<cftry>
    <cfset itemTypesService = createObject("component", "services.ItemTypesUserService")>
    <cfset find = itemTypesService.SELitemtypes_user(valuetype=x.valuetype, userid=users.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_32.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
