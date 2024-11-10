<cfset reportRangeService = createObject("component", "services.ReportRangeService")>
<cfset x = reportRangeService.SELreportranges(excludedRangeIds=[1, 7])>