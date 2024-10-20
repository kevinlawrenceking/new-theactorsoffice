
<cftry>
    <cfset viewtypeid = (view eq "tbl") ? 1 : 2>
    <cfset userService = new services.UserService()>
    <cfset userService.updatetaousers(userid=userid, viewtypeid=viewtypeid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in up_31_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
