<!--- This ColdFusion page handles file deletion and redirects the user accordingly. --->
<cfset userID = session.userID />
<cfparam name="reventID" default="0"/>
<cfparam name="rcontactID" default="0"/>
<cfparam name="eventID" default="0"/>
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<cfinclude template="/include/qry/attachdetails_25_1.cfm" />

<cfset attachFileName = attachdetails.attachFileName />

<!--- Check if the file exists before attempting to delete it. --->
<cfif FileExists(session.userMediaPath & "/" & attachFileName)>
    <cffile action="delete" file="#session.userMediaPath#\#attachFileName#">
    <cfinclude template="/include/qry/del_25_2.cfm" />
<cfelse>
    <p>Sorry, can't delete the file - it doesn't exist.<cfabort>
</cfif>

<!--- Set the return URL for redirection after deletion. --->
<cfset returnUrl = "/app/" & returnurl & "/?contactid=" & contactid & "&eventid=" & eventid & "&tab2_expand=true&t3=1" />

<!--- Redirect the user to the return URL. --->
<cflocation url="#returnUrl#" />

<!---
Modifications:
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Avoided using `#` symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Removed `cftry` and `cfcatch` blocks entirely.
6. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->