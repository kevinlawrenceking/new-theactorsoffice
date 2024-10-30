
<cftry>
    <cfset var eventTypesUserService = createObject("component", "/services/EventTypesUserService")>
    <cfset eventTypesUserService.UPDeventtypes_user(
        id = id,
        new_eventtypecolor = new_eventtypecolor,
        deletelink = deletelink,
        new_iscustom = new_iscustom,
        new_eventtypename = new_eventtypename
    )>
    <cfquery datasource="abod">
        UPDATE eventtypes_user SET isfetch = 1 WHERE id = #id#
    </cfquery>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in update_310_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
