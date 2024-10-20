
<cftry>
    <cfset types = createObject("component", "services.EventTypesUserService").geteventtypes_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in types_334_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
