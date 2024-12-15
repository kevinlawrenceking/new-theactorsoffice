<cfset userService = createObject("component", "services.userService")>

<!--- Example of variables for the function call --->
<cfset userid = form.userid>
<cfset calstarttime = form.calstarttime>
<cfset calendtime = form.calendtime>
<cfset defRows = form.defRows>
<cfset viewtypeid = form.viewtypeid>
<cfset dateformatid = form.dateformatid>
<cfset tzid = form.tzid>

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
