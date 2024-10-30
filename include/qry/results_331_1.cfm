
<cftry>
    <cfset results = createObject("component", "/services/UpdateLogService").RESupdatelog(userId=FindUser.Userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in results_331_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
