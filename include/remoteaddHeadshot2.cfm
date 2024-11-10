<!--- This ColdFusion page handles user file uploads and manages media storage for user accounts. --->
<cfset userID = session.userID />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />
<cfset newIsShare = true />

<!--- Check if the user media path directory exists, if not, create it. --->
<cfif not DirectoryExists(session.userMediaPath)>
    <CFDIRECTORY directory="#session.userMediaPath#" action="create">
</cfif>

<!--- Upload the file to the user's media path. --->
<cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="makeunique" />

<cfset newUserID = session.userID />
<cfset newFileName = CFFILE.serverfile />

<!--- Set the media name if it is not already defined. --->
<cfif len(trim(newMediaName)) eq 0>
    <cfset newMediaName = newFileName />
</cfif>

<cfset newMediaFilename = newFileName />

<cfset newMediaExt = listLast(newMediaFilename, ".") />

<!--- Include the media insertion query script. --->
<cfinclude template="/include/qry/audmedia_ins.cfm" />

<cfset newUploadID = result.generatedkey />

<!--- Redirect to the account page with the new upload ID. --->
<cflocation url="/app/myaccount/?t8=1&tab8_expand=true&new_uploadid=#newUploadID#" addtoken="no" />

<!--- 
Modifications:
1. Standardized variable names and casing.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Simplified conditional check for newMediaName.
4. Removed # symbols from within conditional checks.
5. Ensured consistent attribute quoting, spacing, and formatting.
--->