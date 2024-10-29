
<cftry>
    <cfset eventTypesUserService = createObject("component", "services.EventTypesUserService")>
    <cfset eventTypesUserService.updateEventTypeUser(
        id = id,
        new_eventtypecolor = new_eventtypecolor,
        deletelink = (deletelink eq "1"),
        new_iscustom = (new_iscustom eq "1"),
        new_eventtypename = new_eventtypename
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in update_310_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
