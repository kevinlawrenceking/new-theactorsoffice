
<cftry>
    <cfset userService = new "/services/UserService.cfc"()>
    <cfset userService.updateUserDetails(
        calstarttime = calstarttime,
        calendtime = calendtime,
        defRows = defRows,
        defCountry = defCountry,
        defState = defState,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_159_9.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
