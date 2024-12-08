<cfset result_0 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=0)>
<cfset result_1 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=1)>
<cfset result_2 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=2)>
<cfset result_3 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=3)>
<cfset result_4 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=4)>

<cfdump var="#result_0#">
<cfdump var="#result_1#">
<cfdump var="#result_2#">
<cfdump var="#result_3#">
<cfdump var="#result_4#">
