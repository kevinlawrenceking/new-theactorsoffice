<cfset ReportsRefreshService = createObject("component", "services.ReportsRefreshService")>
<cfparam name="new_audcatid" default="1">
<cfparam name="new_audsourceid" default="0">
<cfparam name="rangestart" default="2022-01-01">
<cfparam name="rangeend" default="2500-12-31">
<cfset rangestart = rangeselected.rangeselected />
<cfset rangeend = rangeselected.rangeend />
<cfset rangeid = rangeselected.rangeid />
    <!--- Report 2 --->
    <cfset ReportsRefreshService.report_2(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audcatid=new_audcatid
    )>

    <!--- Report 3 --->
    <cfset ReportsRefreshService.report_3(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 4 --->
    <cfset ReportsRefreshService.report_4(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 5 --->
    <cfset ReportsRefreshService.report_5(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 7 --->
    <cfset ReportsRefreshService.report_7(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audcatid=new_audcatid
    )>

    <!--- Report 8 --->
    <cfset ReportsRefreshService.report_8(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audcatid=new_audcatid
    )>

    <!--- Report 10 --->
    <cfset ReportsRefreshService.report_10(
        userid=userid, 
        new_rangestart=rangestart, 
        new_rangeend=rangeend
    )>

    <!--- Report 11 --->
    <cfset ReportsRefreshService.report_11(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 12 --->
    <cfset ReportsRefreshService.report_12(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 13 --->
    <cfset ReportsRefreshService.report_13(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 17 --->
    <cfset ReportsRefreshService.report_17(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 18 --->
    <cfset ReportsRefreshService.report_18(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audsourceid=new_audsourceid
    )>



