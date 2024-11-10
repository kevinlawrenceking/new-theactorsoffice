<!--- This ColdFusion page handles user redirection based on the session user ID and specified parameters. --->
<cfset userID = session.userID />
<cfparam name="dir" default="account" />
<cfparam name="audProjectID" default="0" />

<cfinclude template="/include/qry/audMediaUpd.cfm"/>

<!--- Check if the directory is "account" and redirect accordingly --->
<cfif dir is "account">
    <cflocation url="/app/myAccount/?t9=1&tab9_expand=true&t1=0" />
</cfif>

<!--- Check if the directory is "aud" and redirect accordingly --->
<cfif dir is "aud">
    <cflocation url="/app/audition/?audProjectID=#audProjectID#&secID=177" />
</cfif>

<!--- Changes: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->