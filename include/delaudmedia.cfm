<!--- This ColdFusion page handles user redirection based on the event ID. --->
<cfset userID = session.userID />
<cfparam name="eventID" default="0" />

<!--- Include the query template for data retrieval. --->
<cfinclude template="/include/qry/del_99_1.cfm" />

<!--- Set the return URL for redirection based on the event ID. --->
<cfset returnURL = "/app/audition/?eventID=" & eventID & "&secID=177" />

<!--- Redirect the user to the specified return URL. --->
<cflocation url="#returnURL#" addtoken="No">

<!--- Changes made: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->