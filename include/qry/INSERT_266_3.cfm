
<cftry>
    <cfset updateLogService = new "/services/UpdateLogService.cfc" />
    <cfset updateLogService.insertupdatelog(
        oldValue = oldvalue,
        newValue = newvalue,
        recordname = recordname,
        updatename = updatename,
        recid = recid,
        compid = compid,
        userid = userid,
        updatedetails = updatedetails
    ) />
<cfcatch type="any">
    <cfset errorLog("[Error in INSERT_266_3.cfm]: " & cfcatch.message) />
</cfcatch>
</cftry>
