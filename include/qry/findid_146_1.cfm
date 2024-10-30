
<cftry>
    <cfset reportUserService = createObject("component", "services.ReportUserService")>
    <cfset findid = reportUserService.SELreports_user(userID=session.userid, reportID=new_reportid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findid_146_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
