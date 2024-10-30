
<cftry>
    <cfset y = createObject("component", "/services/EventService").SELevents_24014(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in y_191_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching project dates." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
