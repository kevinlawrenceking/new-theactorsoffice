
<cftry>
    <cfset users = createObject("component", "services.UserService").getUserDetails(userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in users_212_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
