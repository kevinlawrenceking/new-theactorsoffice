
<cftry>
    <cfset updateLogService = new "/services/UpdateLogService.cfc"()>
    <cfset updateLogService.INSupdatelog(
        oldvalue = "#oldvalue#",
        newvalue = "#newvalue#",
        recordname = "#recordname#",
        updatename = "#updatename#",
        recid = "#recid#",
        compid = "#compid#",
        userid = "#userid#",
        updatedetails = "#updatedetails#"
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in INSERT_266_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
