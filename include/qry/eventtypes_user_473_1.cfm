
<cftry>
    <cfset eventtypes_user = createObject("component", "services.EventTypesUserService").getUserEventTypes(userid=userid)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in eventtypes_user_473_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
