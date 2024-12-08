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
<Cfabort>