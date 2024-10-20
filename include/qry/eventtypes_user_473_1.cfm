
<cftry>
    <cfset eventtypes_user = createObject("component", "services.EventTypesUserService").geteventtypes_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in eventtypes_user_473_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
