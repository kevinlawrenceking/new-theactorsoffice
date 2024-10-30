
<cftry>
    <cfset check = createObject("component", "services.ItemCategoryXRefUserService").SELitemcatxref_user(
        select_userid = select_userid,
        new_typeid = new_typeid,
        new_catid = new_catid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in check_318_36.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
