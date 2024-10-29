
<cftry>
    <cfset addDaysNo = createObject("component", "services.SystemService").getSystemActions(maint_systemID=maint_systemID, userid=userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in addDaysNo_315_35.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
