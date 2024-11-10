<!--- This ColdFusion page handles file deletion based on user input and redirects accordingly. --->
<cfset userID = session.userID />
<cfparam name="rContactID" default="0" />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<cfinclude template="/include/qry/attachDetails_26_1.cfm" />

<cfset attachFileName = attachDetails.attachFileName />

<!--- Check if the file exists before attempting to delete it. --->
<cfif FileExists(session.userMediaPath & "/" & attachFileName)>
    <cffile action="delete" file="#session.userMediaPath#\#attachFileName#">
    <cfinclude template="/include/qry/del_25_2.cfm" />
<cfelse>
    <p>Sorry, can't delete the file - it doesn't exist.<cfabort>
</cfif>

<cfset returnURL = "/app/audition/?audProjectID=" & audProjectID & "&secID=178" />

<!--- Redirect to the specified return URL after processing. --->
<cflocation url="#returnURL#">

<!--- Changes made:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Simplified string concatenation for returnURL.
--->