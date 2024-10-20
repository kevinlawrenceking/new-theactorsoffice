
<cftry>
    <cfset userService = new "/services/UserService.cfc"()>
    <cfset userService.updatetaousers(
        calstarttime = calstarttime,
        calendtime = calendtime,
        defRows = defRows,
        defCountry = defCountry,
        defState = defState,
        userid = userid
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_159_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
