<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report 6 Test</title>
</head>
<body>
    <h1>Testing Report 6</h1>

    <!-- Initialize the ReportsRefreshService component -->
    <cfset ReportsRefreshService = createObject("component", "services.ReportsRefreshService")>

    <!-- Fetch results for different audsourceidb values -->
    <cfset result_0 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=0)>
    <cfset result_1 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=1)>
    <cfset result_2 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=2)>
    <cfset result_3 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=3)>
    <cfset result_4 = ReportsRefreshService.report_6(userid=30, rangestart="2023-01-01", rangeend="2023-12-31", new_audsourceidb=4)>

    <!-- Display the results -->
    <h2>Results for new_audsourceidb = 0</h2>
    <cfdump var="#result_0#">

    <h2>Results for new_audsourceidb = 1</h2>
    <cfdump var="#result_1#">

    <h2>Results for new_audsourceidb = 2</h2>
    <cfdump var="#result_2#">

    <h2>Results for new_audsourceidb = 3</h2>
    <cfdump var="#result_3#">

    <h2>Results for new_audsourceidb = 4</h2>
    <cfdump var="#result_4#">
</body>
</html>
