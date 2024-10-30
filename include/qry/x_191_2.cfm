
<cftry>
    <cfset x = createObject("component", "/services/EventService").SELevents_24012(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_191_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
