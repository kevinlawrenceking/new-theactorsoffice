<!--- This ColdFusion page retrieves details from the audmedia table based on the provided media ID. --->

<cfquery name="audmedia_details">
    <!--- Query to select all columns from audmedia where mediaid matches the provided mediaid variable. --->
    select * 
    from audmedia 
    where mediaid = #mediaid#
</cfquery>
