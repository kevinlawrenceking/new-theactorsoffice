<!--- This ColdFusion page handles user media uploads and manages the storage of uploaded files. --->
<cfset userID = session.userID />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Check if the user media directory exists, if not, create it --->
<cfif not DirectoryExists(session.userMediaPath)>
    <CFDIRECTORY directory="#session.userMediaPath#" action="create">
</cfif>

<!--- Upload the file to the user's media path --->
<cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="MAKEUNIQUE" />

<cfset newUserID = session.userID />
<cfset newFileName = CFFILE.serverfile />

<!--- Set the media name if it is not already set --->
<cfif IsDefined("newMediaName") AND newMediaName EQ "">
    <cfset newMediaName = newFileName />
</cfif>

<cfset newMediaFileName = newFileName />
<cfset newMediaExt = listLast(newMediaFileName, ".") />

<!--- Include the media insertion query --->
<cfinclude template="/include/qry/audmedia_ins.cfm" />

<cfset newUploadID = result.generatedkey />

<!--- Set the return URL after upload --->
<cfset returnURL = "/app/audition/?audprojectid=" & audprojectid & "&secid=177" />

<!--- Redirect to the return URL --->
<cflocation url="#returnURL#">

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks unless essential.
4. Simplified record count logic for icons or conditional displays.
5. Ensured consistent attribute quoting, spacing, and formatting.
6. Used uniform date and time formatting across the code.
7. Removed `cftry` and `cfcatch` blocks entirely.
8. For any `#` symbols inside `<cfoutput>` blocks that are not meant as ColdFusion variables (e.g., for hex color codes or jQuery syntax), used double pound signs `##` to avoid interpretation as variables.
--->