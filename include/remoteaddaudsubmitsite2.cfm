<!--- This ColdFusion page processes category lists and includes relevant query templates based on record counts. --->
<cfif len(trim(catlist))>
    <!--- Check if catlist is not empty and sort it numerically in ascending order. --->
    <cfset sortedCatList = listSort(catlist, "numeric", "asc")>
</cfif>

<!--- Include the query template to find records. --->
<cfinclude template="/include/qry/find_197_1.cfm" />

<cfif find.recordcount eq 1>
    <!--- If exactly one record is found, include the update template. --->
    <cfinclude template="/include/qry/update_197_2.cfm">
</cfif>

<cfif find.recordcount eq 0>
    <!--- If no records are found, include the add template. --->
    <cfinclude template="/include/qry/add_197_3.cfm">
</cfif>

<!--- Redirect to the my account page with specific parameters. --->
<cflocation url="/app/myaccount/?t4=1&tab4_expand=true" addtoken="no" />

<!---
Modifications were made based on the following rules:
1. Maintain consistent and efficient conditional logic, especially for styling or control structures.
2. Remove unnecessary `<cfoutput>` tags around variable outputs.
3. Avoid using `#` symbols within conditional checks unless essential.
4. Simplify record count logic for icons or conditional displays.
5. Standardize variable names and casing.
6. Ensure consistent attribute quoting, spacing, and formatting.
9. Remove any `cftry` and `cfcatch` blocks entirely.
--->