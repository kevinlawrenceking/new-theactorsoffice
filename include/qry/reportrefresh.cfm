<cfset ReportsRefreshService = createObject("component", "services.ReportsRefreshService")>
<cfparam name="new_audcatid" default="1">
<cfparam name="new_audsourceid" default="0">
<cfparam name="rangestart" default="2022-01-01">
<cfparam name="rangeend" default="2500-12-31">
<cfset rangestart = rangeselected.rangestart />
<cfset rangeend = rangeselected.rangeend />
<cfset rangeid = rangeselected.rangeid />
<cfif isdefined('form.new_audcatid')>
    <cfset new_audcatid = form.new_audcatid />
</cfif>

<!--- Initialize summary array --->
<cfset reportSummaries = []>

<!--- Report 2 --->
<cfset report2Summary = ReportsRefreshService.report_2(
    userid=userid, 
    rangestart=rangestart, 
    rangeend=rangeend, 
    new_audcatid=new_audcatid
)>
<cfset arrayAppend(reportSummaries, {reportId=2, totalSelected=report2Summary.totalSelected, totalInserted=report2Summary.totalInserted})>

<!--- Report 3 --->
<cfset report3Summary = ReportsRefreshService.report_3(
    userid=userid, 
    rangestart=rangestart, 
    rangeend=rangeend
)>
<cfset arrayAppend(reportSummaries, {reportId=3, totalSelected=report3Summary.totalSelected, totalInserted=report3Summary.totalInserted})>

<!--- Report 4 --->
<cfset report4Summary = ReportsRefreshService.report_4(
    userid=userid, 
    rangestart=rangestart, 
    rangeend=rangeend
)>
<cfset arrayAppend(reportSummaries, {reportId=4, totalSelected=report4Summary.totalSelected, totalInserted=report4Summary.totalInserted})>

<!--- Continue similarly for other reports --->
<cfset report5Summary = ReportsRefreshService.report_5(userid=userid, rangestart=rangestart, rangeend=rangeend)>
<cfset arrayAppend(reportSummaries, {reportId=5, totalSelected=report5Summary.totalSelected, totalInserted=report5Summary.totalInserted})>

<cfset report7Summary = ReportsRefreshService.report_7(userid=userid, rangestart=rangestart, rangeend=rangeend, new_audcatid=new_audcatid)>
<cfset arrayAppend(reportSummaries, {reportId=7, totalSelected=report7Summary.totalSelected, totalInserted=report7Summary.totalInserted})>

<cfset report8Summary = ReportsRefreshService.report_8(userid=userid, rangestart=rangestart, rangeend=rangeend, new_audcatid=new_audcatid)>
<cfset arrayAppend(reportSummaries, {reportId=8, totalSelected=report8Summary.totalSelected, totalInserted=report8Summary.totalInserted})>

<cfset report10Summary = ReportsRefreshService.report_10(userid=userid, new_rangestart=rangestart, new_rangeend=rangeend)>
<cfset arrayAppend(reportSummaries, {reportId=10, totalSelected=report10Summary.totalSelected, totalInserted=report10Summary.totalInserted})>

<cfset report11Summary = ReportsRefreshService.report_11(userid=userid, rangestart=rangestart, rangeend=rangeend)>
<cfset arrayAppend(reportSummaries, {reportId=11, totalSelected=report11Summary.totalSelected, totalInserted=report11Summary.totalInserted})>

<cfset report12Summary = ReportsRefreshService.report_12(userid=userid, rangestart=rangestart, rangeend=rangeend)>
<cfset arrayAppend(reportSummaries, {reportId=12, totalSelected=report12Summary.totalSelected, totalInserted=report12Summary.totalInserted})>

<cfset report13Summary = ReportsRefreshService.report_13(userid=userid, rangestart=rangestart, rangeend=rangeend)>
<cfset arrayAppend(reportSummaries, {reportId=13, totalSelected=report13Summary.totalSelected, totalInserted=report13Summary.totalInserted})>

<cfset report17Summary = ReportsRefreshService.report_17(userid=userid, rangestart=rangestart, rangeend=rangeend)>
<cfset arrayAppend(reportSummaries, {reportId=17, totalSelected=report17Summary.totalSelected, totalInserted=report17Summary.totalInserted})>

<cfset report18Summary = ReportsRefreshService.report_18(userid=userid, rangestart=rangestart, rangeend=rangeend, new_audsourceid=new_audsourceid)>
<cfset arrayAppend(reportSummaries, {reportId=18, totalSelected=report18Summary.totalSelected, totalInserted=report18Summary.totalInserted})>

<!--- Display Report Summaries --->
<div>
    <h3>Report Summaries</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Report ID</th>
                <th>Total Selected</th>
                <th>Total Inserted</th>
            </tr>
        </thead>
        <tbody>
            <cfloop array="#reportSummaries#" index="summary">
                <tr>
                    <td>#summary.reportId#</td>
                    <td>#summary.totalSelected#</td>
                    <td>#summary.totalInserted#</td>
                </tr>
            </cfloop>
        </tbody>
    </table>
</div>
