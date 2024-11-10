<!--- This ColdFusion page handles the inclusion of various query templates and redirects based on the value of the variable 'pgrtn'. --->
<cfparam name="isVisible" default="0" />

<!--- Include the first query template for adding data --->
<cfinclude template="/include/qry/add_240_1.cfm" />

<!--- Include the second query template for updating data --->
<cfinclude template="/include/qry/updatep_240_2.cfm" />

<!--- Include the third query template for fetching data --->
<cfinclude template="/include/qry/x_240_3.cfm" />

<!--- Loop through the query results and include the update template for each row --->
<cfloop query="x">
    <cfinclude template="/include/qry/update_240_4.cfm" />
</cfloop>

<!--- Redirect based on the value of 'pgrtn' for different scenarios --->
<cfif pgrtn is "P">
    <cflocation url="/app/myaccount/?t1=1&target_id=#new_sitetypeid#" />
</cfif>

<cfif pgrtn is "D">
    <cflocation url="/app/myaccount/?t1=1&target_id=#new_sitetypeid#" />
</cfif>

<cfif pgrtn is "z">
    <cflocation url="/app/dashboard_new/" />
</cfif>

<!--- Changes made: 
1. Removed unnecessary # symbols in conditional checks.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->