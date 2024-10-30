
<cftry>
    <cfset actions = createObject("component", "services.SystemService").SELfusystems_23944(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in actions_159_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
