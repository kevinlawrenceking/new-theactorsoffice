<cfset objItemCategoryXRefUserService = createObject("component", "services.ItemCategoryXRefUserService")>
<cfset objItemCategoryXRefUserService.INSitemcatxref_user_24468(
    new_typeid = new_typeid,
    new_catid = new_catid,
    select_userid = select_userid
)>
<!--- Update the database to set isfetch = 1 --->
<cfquery result="result" datasource="abod">
    UPDATE your_table_name SET isfetch = 1 WHERE your_condition
</cfquery>