<!--- This ColdFusion page retrieves the total count of records from a filtered query. --->

<cfquery dbtype="query" name="qCount">
    <!--- Query to count the total number of records in the filtered dataset --->
    SELECT COUNT(#sIndexColumn#) as total
    FROM qFiltered
</cfquery>
