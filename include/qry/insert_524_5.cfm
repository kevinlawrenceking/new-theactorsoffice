
<cftry>
    <cfset reportUserService = createObject("component", "services.ReportUserService")>
    <cfset reportUserService.INSreports_user(
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
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_524_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
