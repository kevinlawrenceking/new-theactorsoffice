<cfset reportRangeService = createObject("component", "services.ReportRangeService")>
<cfset ranges = reportRangeService.getReportRanges({})>
<cflog text="[Error in ranges_524_7.cfm]: #cfcatch.message#" file="errorLog">