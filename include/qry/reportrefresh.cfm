<cfset objReportsService = createObject("component", "ReportsRefreshService")>

<!--- Define the common variables --->
<cfset userid = session.userid>
<cfset rangestart = "2024-01-01">
<cfset rangeend = "2024-12-31">

<!--- Optional parameters for specific reports --->
<cfset new_audcatid = 1>
<cfset new_audsourceid = 0>

<!--- Execute all reports --->
<cftry>
    <!--- Report 2 --->
    <cfset objReportsService.report_2(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audcatid=new_audcatid
    )>

    <!--- Report 3 --->
    <cfset objReportsService.report_3(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 4 --->
    <cfset objReportsService.report_4(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 5 --->
    <cfset objReportsService.report_5(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 7 --->
    <cfset objReportsService.report_7(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audcatid=new_audcatid
    )>

    <!--- Report 8 --->
    <cfset objReportsService.report_8(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audcatid=new_audcatid
    )>

    <!--- Report 10 --->
    <cfset objReportsService.report_10(
        userid=userid, 
        new_rangestart=rangestart, 
        new_rangeend=rangeend
    )>

    <!--- Report 11 --->
    <cfset objReportsService.report_11(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 12 --->
    <cfset objReportsService.report_12(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 13 --->
    <cfset objReportsService.report_13(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 17 --->
    <cfset objReportsService.report_17(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend
    )>

    <!--- Report 18 --->
    <cfset objReportsService.report_18(
        userid=userid, 
        rangestart=rangestart, 
        rangeend=rangeend, 
        new_audsourceid=new_audsourceid
    )>

    <cfcatch type="any">
        <!--- Log the error (adjust the path for your logging mechanism) --->
        <cfset writeOutput("Error running reports: #cfcatch.message#")>
    </cfcatch>
</cftry>

<cfoutput>
    Reports have been successfully processed.
</cfoutput>
