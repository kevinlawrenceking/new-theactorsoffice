
<cftry>
    <cfset types = createObject("component", "services.EventTypesUserService").getEventTypesForUser(userid=userid, isAuditionModule=(isAuditionModule eq "1"))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_333_2.cfm]: #cfcatch.message#">
        <cfset types = queryNew("eventtypename", "varchar")>
    </cfcatch>
</cftry>
