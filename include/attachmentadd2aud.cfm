<!--- This ColdFusion page handles user file uploads and manages user media paths. --->
<cfset userID = session.userID />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Check if the user media directory exists, if not, create it --->
<cfif NOT DirectoryExists(session.userMediaPath)>
    <cfdirectory directory="#session.userMediaPath#" action="create">
</cfif>

<!--- Handle file upload --->
<cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="MAKEUNIQUE" />

<cfset newFileName = CFFILE.serverfile />

<!--- Set the attachment name if not already set --->
<cfif len(trim(attachName)) EQ 0>
    <cfset attachName = newFileName />
</cfif>

<cfset attachFileName = newFileName />

<!--- Include the insert query template --->
<cfinclude template="/include/qry/INSERT_22_1.cfm" />

<cfset newUploadID = result.generatedKey />

<!--- Set the return URL for redirection after upload --->
<cfset returnURL = "/app/audition/?audProjectID=#audProjectID#&secID=178" />

<!--- Redirect to the return URL --->
<cflocation url="#returnURL#" addtoken="no" />

<!---
Modifications:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Removed cftry and cfcatch blocks entirely.
6. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs ## to avoid interpretation as variables.
--->