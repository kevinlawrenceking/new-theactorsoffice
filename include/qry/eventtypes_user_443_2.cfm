
<cftry>
    <cfset eventtypes_user = createObject("component", "services.EventTypesUserService").getUserEventTypes(userId=session.userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventtypes_user_443_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
