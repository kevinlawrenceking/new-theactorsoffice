
<cftry>
    <cfset findid = createObject("component", "services.ReportUserService").getReportUserID(session.userid, new_reportid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findid_146_1.cfm]: #cfcatch.message#">
        <cfset findid = queryNew("new_iD", "integer")>
    </cfcatch>
</cftry>
