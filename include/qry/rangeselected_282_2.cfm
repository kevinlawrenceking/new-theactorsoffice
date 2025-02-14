<cfoutput>new_rangeid:#new_rangeid#</cfoutput><cfabort>
<cfset reportRangeService = createObject("component", "services.ReportRangeService") />
<cfset rangeselected = reportRangeService.(new_rangeid=new_rangeid) />