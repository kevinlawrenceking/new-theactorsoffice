
<cftry>
    <cfset find = createObject("component", "services.ItemTypesUserService").getitemtypes_user(x.valuetype, select_userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_318_35.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
