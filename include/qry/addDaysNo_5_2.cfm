
<cftry>
    <cfset addDaysNo = createObject("component", "services.SystemService").SELfusystems(
        new_systemid = new_systemid,
        session_userid = session.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addDaysNo_5_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving system actions." detail="#cfcatch.message#">
    </cfcatch>
</cftry>
