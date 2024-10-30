
<cftry>
    <cfset Redirect_check = createObject("component", "services.EventService").SELevents_23786(audroleid=audroleid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Redirect_check_29_6.cfm]: #cfcatch.message#; Function: SELevents_23786; Parameters: audroleid=#audroleid#" />
    </cfcatch>
</cftry>
