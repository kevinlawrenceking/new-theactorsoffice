<!--- This ColdFusion page handles redirection after processing audition project information. --->
<cfinclude template="/include/qry/linkmedia_152_1.cfm" />

<!--- Set the return URL for redirection after processing. --->
<cfset returnURL = "/app/audition/?audprojectid=" & audProjectID & "&secid=177" />

<!--- Redirect to the specified return URL. --->
<cflocation url="#returnURL#">

<!--- Changes made:
1. Removed unnecessary <cfoutput> tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->