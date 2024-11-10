<!--- This ColdFusion page handles the insertion of a note and redirects based on the contact ID provided. --->
<cfparam name="contactId" default="0" />
<cfinclude template="/include/qry/InsertNote_173_1.cfm" />

<!--- Check if the contact ID is 0 to determine the return URL. --->
<cfif contactId is 0>
    <cfset returnUrl = "/app/#returnUrl#/" />
<cfelse>
    <cfset returnUrl = "/app/#returnUrl#?contactId=#contactId#" />
</cfif>

<!--- Redirect to the determined return URL with a query parameter. --->
<cflocation url="#returnUrl#&t3=1">

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Avoided using # symbols within conditional checks.
--->