
<cftry>
    <cfset action_user = createObject("component", "services.SystemService").SELfusystems_24321(
        systemID = mysystems.systemid,
        userID = session.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in action_user_295_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
