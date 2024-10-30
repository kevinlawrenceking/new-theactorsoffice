
<cftry>
    <cfset addDaysNo = createObject("component", "services.SystemService").SELfusystems_24750(systemid=systemid, userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addDaysNo_528_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
