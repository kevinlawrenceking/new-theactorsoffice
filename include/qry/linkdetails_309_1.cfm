
<cftry>
    <cfset linkdetails = createObject("component", "services.EventTypesUserService").geteventtypes_user(id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in linkdetails_309_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
