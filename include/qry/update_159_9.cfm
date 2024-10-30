
<cftry>
    <cfset variables.userService = createObject("component", "services.UserService")>
    <cfset variables.userService.UPDtaousers_23951(
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
