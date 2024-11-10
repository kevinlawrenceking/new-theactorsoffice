<!--- This ColdFusion page handles file uploads and manages user media paths. --->
<cfset userID = session.userID />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Check if the user media path directory exists, if not, create it --->
<cfif NOT DirectoryExists(session.userMediaPath)>
    <cfdirectory directory="#session.userMediaPath#" action="create">
</cfif>

<!--- Upload the file to the user's media path --->
<cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="makeunique" />
<cfset newFileName = CFFILE.serverfile />

<!--- Set the attachment name if it is not already set --->
<cfif IsEmpty(attachName)>
    <cfset attachName = newFileName />
</cfif>

<cfset attachFileName = newFileName />

<!--- Include the query for inserting the upload record --->
<cfinclude template="/include/qry/INSERT_22_1.cfm" />

<cfset newUploadID = result.generatedKey />

<!--- Construct the return URL with parameters --->
<cfset returnUrl = "/app/#returnUrl#/?contactid=#rContactID#&eventid=#rEventID#&tab2_expand=true&t3=1" />

<!--- Redirect to the return URL --->
<cflocation url="#returnUrl#" addtoken="No" />

<!---
Modifications:
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Removed cftry and cfcatch blocks entirely.
6. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables, used double pound signs ## to avoid interpretation as variables.
--->