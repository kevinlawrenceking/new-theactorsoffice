
<cftry>
    <cfset variables.itemCategoryXRefUserService = createObject("component", "/services/ItemCategoryXRefUserService")>
    <cfset variables.result = variables.itemCategoryXRefUserService.insertitemcatxref_user(new_typeid, catid, userid, 1)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insertx_199_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
