
<cftry>
    <cfset results = createObject("component", "services.UpdateLogService").getupdatelog(FindUser.Userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in results_331_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
