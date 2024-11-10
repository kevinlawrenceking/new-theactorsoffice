<!--- This ColdFusion page determines the return URL based on the contact ID provided and redirects the user accordingly. --->
<cfparam name="contactId" default="0" />
<cfinclude template="/include/qry/updateNote_179_1.cfm" />

<!--- Check if the contact ID is 0 to set the return URL accordingly --->
<cfif contactId eq 0>
    <cfset returnURL = "/app/#returnurl#/" />
<cfelse>
    <cfset returnURL = "/app/#returnurl#?contactid=#contactId#" />
</cfif>

<!--- Redirect to the determined return URL with a query parameter --->
<cflocation url="#returnURL#&t3=1">

<!--- 
Modifications made based on the following rules:
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->