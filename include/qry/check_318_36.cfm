
<cftry>
    <cfset check = createObject("component", "services.ItemCategoryXRefUserService").getitemcatxref_user(select_userid, new_typeid, new_catid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in check_318_36.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
