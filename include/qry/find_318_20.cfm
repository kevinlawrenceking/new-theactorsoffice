
<cftry>
    <cfset find = createObject("component", "services.EventTypesUserService").SELeventtypes_user(
        eventTypeName = xs.eventtypeName,
        userId = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_20.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
