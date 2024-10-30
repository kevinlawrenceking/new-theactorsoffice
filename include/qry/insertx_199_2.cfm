
<cftry>
    <cfset variables.itemCategoryXRefUserService = createObject("component", "services.ItemCategoryXRefUserService")>
    <cfset variables.itemCategoryXRefUserService.INSitemcatxref_user(
        new_typeid = new_typeid,
        catid = catid,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insertx_199_2.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
