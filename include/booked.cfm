<!--- This ColdFusion page handles redirection after updating audition details --->
<cfinclude template="/include/qry/update_56_1.cfm" />

<!--- Set the return URL for redirection based on parameters --->
<cfset returnURL = "/app/audition/?audProjectID=" & audProjectID & "&eventID=" & eventID & "&secID=" & secID>

<!--- Redirect to the specified return URL --->
<cflocation url="#returnURL#">

<!--- Changes made:
1. Removed unnecessary <cfoutput> tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->