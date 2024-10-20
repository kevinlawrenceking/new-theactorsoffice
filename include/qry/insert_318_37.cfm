
<cftry>
    <cfset result = createObject("component", "/services/ItemCategoryXRefUserService").insertitemcatxref_user(new_typeid, new_catid, select_userid)>
    <cfcatch>
        <cfset errorLog = "[Error in insert_318_37.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
