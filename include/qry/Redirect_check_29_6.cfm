
<cftry>
    <cfset Redirect_check = createObject("component", "services.EventService").getEvents(audroleid=audroleid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Redirect_check_29_6.cfm]: #cfcatch.message#; Function: getEvents; Parameters: audroleid=#audroleid#" />
        <cfset Redirect_check = queryNew("", "") />
    </cfcatch>
</cftry>
