
<cftry>
    <cfset Redirect_check = createObject("component", "/services/EventService").getevents(audroleid, 3)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Redirect_check_29_6.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
