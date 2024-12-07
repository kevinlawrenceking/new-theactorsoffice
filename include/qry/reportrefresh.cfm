<cfset ReportsRefreshService = createObject("component", "services.ReportsRefreshService")>
 
 
<cfparam name="rangestart" default="2022-01-01">
<cfparam name="rangeend" default="2500-12-31">
<cfset rangestart = rangeselected.rangestart />
<cfset rangeend = rangeselected.rangeend />
<cfset rangeid = rangeselected.rangeid />
    <!--- Report 2 --->
    <cfset ReportsRefreshService.report_2(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audcatid=new_audcatid
    )>
 