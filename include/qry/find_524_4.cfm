
<cftry>
    <cfset find = createObject("component", "/services/ReportUserService").getreports_user(
        reportid = x.reportid, 
        userid = u.userid, 
        reportname = x.reportname
    )>
<cfcatch>
    <cfset errorLog = "[Error in find_524_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
