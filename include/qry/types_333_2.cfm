
<cftry>
    <cfset types = createObject("component", "services.EventTypesUserService").geteventtypes_user(userid=userid, isAuditionModule=isAuditionModule)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_333_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
