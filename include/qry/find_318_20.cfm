
<cftry>
    <cfset find = createObject("component", "services.EventTypesUserService").geteventtypes_user(xs.eventtypeName, users.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_318_20.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
