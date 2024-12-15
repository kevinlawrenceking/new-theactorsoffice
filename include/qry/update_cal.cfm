<cfset userService = createObject("component", "services.userService")>

<!--- Example of variables for the function call --->


<!--- Call the function --->
<cfset userService.update_cal(
    userid = userid,
    calstarttime = calstarttime,
    calendtime = calendtime,
    defRows = defRows,
    viewtypeid = viewtypeid,
    dateformatid = dateformatid,
    tzid = tzid
)>
<cfabort>