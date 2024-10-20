
<cftry>
    <cfset eventtypes_user = createObject("component", "services.EventTypesUserService").geteventtypes_user(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in eventtypes_user_443_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
