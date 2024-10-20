
<cftry>
    <cfset eventTypesUserService = new "/services/EventTypesUserService.cfc" />
    <cfset eventTypesUserService.updateeventtypes_user(
        id = id,
        new_eventtypecolor = new_eventtypecolor,
        deletelink = deletelink,
        new_iscustom = new_iscustom,
        new_eventtypename = new_eventtypename
    ) />
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in update_310_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
