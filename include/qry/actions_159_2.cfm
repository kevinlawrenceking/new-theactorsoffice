
<cftry>
    <cfset actions = createObject("component", "services.SystemService").getActionDetailsForUser(userid=#userid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in actions_159_2.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
