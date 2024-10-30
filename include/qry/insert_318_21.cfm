
<!--- This ColdFusion page handles the insertion of event types for users into the database. --->

<cftry>
    <cfset objEventTypesUserService = createObject("component", "services.EventTypesUserService")>
    <cfset objEventTypesUserService.INSeventtypes_user(
        eventTypeName = xs.eventTypeName,
        eventtypedescription = xs.eventtypedescription,
        eventtypecolor = xs.eventtypecolor,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_318_21.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
