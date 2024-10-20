
<cftry>
    <cfset reportUserService = new "/services/ReportUserService.cfc">
    <cfset reportUserService.insertreports_user(
        reportid = x.reportid,
        reportname = x.reportname,
        reportorderno = x.reportorderno,
        reporttypeid = x.reporttypeid,
        reportdescription = x.reportdescription,
        userid = u.userid,
        colmd = x.colmd,
        colxl = colxl,
        datalabel = x.datalabel,
        colorid = x.colorid
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
<cfcatch type="any">
    <cfset errorLog("[Error in insert_524_5.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
