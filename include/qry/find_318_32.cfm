
<cftry>
    <cfset find = createObject("component", "services.ItemTypesUserService").getitemtypes_user(x.valuetype, users.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_318_32.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
