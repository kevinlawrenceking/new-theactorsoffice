<!--- This ColdFusion page includes query templates and redirects to the audition page based on the provided project ID. --->
<cfinclude template="/include/qry/del_230_1.cfm" /> <!--- Include the first query template for deletion --->
<cfinclude template="/include/qry/del2_230_2.cfm" /> <!--- Include the second query template for deletion --->
<cfinclude template="/include/qry/remove_191_11.cfm" /> <!--- Include the removal query template --->
<cflocation url="/app/audition/?audprojectid=#audprojectid#" addtoken="no" /> <!--- Redirect to the audition page with the specified project ID --->

<!---
Modifications made:
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
6. Ensured consistent attribute quoting, spacing, and formatting.
9. Removed any `cftry` and `cfcatch` blocks entirely.
10. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->