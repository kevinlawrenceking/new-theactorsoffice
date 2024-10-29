
<cftry>
    <cfset variables.itemCategoryXRefUserService = createObject("component", "/services/ItemCategoryXRefUserService")>
    <cfset variables.itemCategoryXRefUserService.insertItemCatXrefUser(
        new_typeid = new_typeid,
        new_catid = new_catid,
        select_userid = select_userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_318_37.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
