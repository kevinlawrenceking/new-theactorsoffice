
<cftry>
    <cfset types = createObject("component", "services.EventTypesUserService").SELeventtypes_user_24486(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_334_2.cfm]: #cfcatch.message#">
        <cfset types = queryNew("eventtypename")>
    </cfcatch>
</cftry>
