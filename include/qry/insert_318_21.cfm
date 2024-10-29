
<cftry>
    <cfset eventTypesUserService = new "/services/EventTypesUserService.cfc"()>
    <cfset eventTypesUserService.insertEventTypeUser(
        eventTypeName = xs.eventTypeName,
        eventtypedescription = xs.eventtypedescription,
        eventtypecolor = xs.eventtypecolor,
        userid = users.userid
    )>
    <cfquery datasource="abod">
        UPDATE database SET isfetch = 1 WHERE condition
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_318_21.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
